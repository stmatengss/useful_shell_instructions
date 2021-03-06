/* Verify that the buffer length is not larger than the MTU */
ret = ibv_query_port(ctx.id->verbs, ctx.id->port_num, &port_attr);
if (ret) {
  VERB_ERR("ibv_query_port", ret);
  goto out;
}
if (ctx.msg_length > (1 << port_attr.active_mtu + 7)) {
  printf("buffer length %d is larger then active mtu %d\n",
  ctx.msg_length, 1 << (port_attr.active_mtu + 7));
  goto out;
}

wr.sg_list = &sg_list;
wr.dc.ah = ah[mn];
wr.dc.dct_access_key = DCTBENCH_DCT_KEY;
wr.dc.dct_number = remote_dct_attr[mn]->dct_num;


if (user_param->use_event) {
  struct ibv_cq *ev_cq;
  void          *ev_ctx;
  if (ibv_get_cq_event(ctx->channel, &ev_cq, &ev_ctx)) {
    fprintf(stderr, "Failed to get cq_event\n");
    return 1;
  }                
  if (ev_cq != ctx->cq) {
    fprintf(stderr, "CQ event for unknown CQ %p\n", ev_cq);
    return 1;
  }
  if (ibv_req_notify_cq(ctx->cq, 0)) {
    fprintf(stderr, "Couldn't request CQ notification\n");
    return 1;
  }
}
