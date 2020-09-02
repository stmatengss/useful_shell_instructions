* https://community.mellanox.com/s/article/what-is-irq-affinity-x

* https://github.com/sbates130272/rdmatools/blob/master/myfirstrdma/myfirstrdma.c
* https://github.com/rleon/rdma-plumbing/blob/master/librdmacm/examples/rdma_xserver.c
* https://github.com/styxyang/codelib/blob/bfae1bca8e516eb3594213ef16cd202f4c665f7b/c/ibtest/ib-conn.c
* https://github.com/WANG-lp/RDMA/blob/master/pingpong-server.cpp
* https://github.com/IMCG/kiro/blob/master/src/kiro-rdma.h
* https://github.com/dyinnz/memecached-RDMA-test/blob/master/libevent-server.c
* https://github.com/pixelrazor/rdma-cs/blob/master/rdma%20v2/server.c
* https://www.mellanox.com/related-docs/prod_software/Performance_Tuning_Guide_for_Mellanox_Network_Adapters_Archive.pdf
* https://community.mellanox.com/docs/DOC-2517
* https://community.mellanox.com/docs/DOC-2898
* https://github.com/jcxue/RDMA-Tutorial
* https://patchwork.kernel.org/project/linux-rdma/list/

```
Device #1:
----------

  Device Type:      ConnectX3
  Part Number:      MCX354A-QCB_Ax
  Description:      ConnectX-3 VPI adapter card; dual-port QSFP; QDR IB (40Gb/s) and 10GigE;
 PCIe3.0x8 8GT/s; RoHS R6
  PSID:             MT_1090110018
  PCI Device Name:  42:00.0
  Port1 MAC:        f4521491ba11
  Port2 MAC:        f4521491ba12
  Versions:         Current        Available     
     FW             2.36.5150      2.36.5000     
     PXE            3.4.0740       3.4.0718      

  Status:           Up to date
  Device #1:                                                                   
----------                                                                   
                                                                             
  Device Type:      ConnectX3                                                
  Part Number:      MCX354A-QCB_Ax                                           
  Description:      ConnectX-3 VPI adapter card; dual-port QSFP; QDR IB (40Gb
/s) and 10GigE; PCIe3.0x8 8GT/s; RoHS R6                                     
  PSID:             MT_1090110018                                            
  PCI Device Name:  42:00.0                                                  
  Port1 MAC:        f4521491ba21                                             
  Port2 MAC:        f4521491ba22                                             
  Versions:         Current        Available                                 
     FW             2.42.5000      2.42.5000                                 
     PXE            3.4.0752       3.4.0752                                  
                                                                             
  Status:           Up to date                                               
----------

Infiniband device 'mlx4_0' port 1 status:                       
        default gid:     fe80:0000:0000:0000:f452:1403:0091:ba21
        base lid:        0x3                                    
        sm lid:          0xc                                    
        state:           4: ACTIVE                              
        phys state:      5: LinkUp                              
        rate:            40 Gb/sec (4X QDR)                     
        link_layer:      InfiniBand                             
                                                                
Infiniband device 'mlx4_0' port 2 status:                       
        default gid:     fe80:0000:0000:0000:f652:14ff:fe91:ba22
        base lid:        0x0                                    
        sm lid:          0x0                                    
        state:           4: ACTIVE                              
        phys state:      5: LinkUp                              
        rate:            10 Gb/sec (1X QDR)                     
        link_layer:      Ethernet                               

```
* Softiwarp https://www.reflectionsofthevoid.com/2011/03/how-to-install-soft-iwarp-on-ubuntu.html
* RDMA Tools https://community.mellanox.com/docs/DOC-3134
* RoCE Q&A https://www.chelsio.com/roce/
* Tools http://www.hpcadvisorycouncil.com/events/switzerland_workshop/pdf/Presentations/Day%202/9_OFED%20SW%20stack.pdf
* NBDX https://community.mellanox.com/docs/DOC-2113 
* Memory Window https://www.openfabrics.org/images/eventpresos/2017presentations/112_Extended_Memory_Windows-_TOved.pdf
* Using RDMA access NVM https://openfabrics.org/images/2018workshop/presentations/112_CLameter_NewTypesofMemory.pdf?a7362a&a7362a&e3d5f1&e3d5f1
* RDMA Tutorial https://www.csm.ornl.gov/workshops/openshmem2014/documents/presentations_and_tutorials/Tutorials/Verbs%20programming%20tutorial-final.pdf
* Remote Memory Management https://openfabrics.org/images/2018workshop/presentations/304_LLiss_OnDeviceMemory.pdf?a7362a&a7362a&e3d5f1&e3d5f1
* DCT https://openfabrics.org/images/2018workshop/presentations/303_ARosenbaum_DynamicallyConnectedTransport.pdf
* RDMA Perf https://community.mellanox.com/docs/DOC-2802


========================== Config =============================
https://community.mellanox.com/s/article/howto-find-the-logical-to-physical-port-mapping--linux-x

========================= SoftiWrap ===========================
https://github.com/animeshtrivedi/blog/blob/master/post/2019-06-26-siw.md

========================= Tools ===============================
https://community.mellanox.com/s/article/roce-rdma-tools

https://community.mellanox.com/s/article/understanding-mlx5-ethtool-counters
