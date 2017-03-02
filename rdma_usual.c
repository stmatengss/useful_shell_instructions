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
