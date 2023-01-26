package firstproject.simulations;

import inet.examples.inet.ipv4hook.MyHost;
import inet.examples.inet.ipv4hook.MyRouter;
import inet.networklayer.configurator.ipv4.Ipv4FlatNetworkConfigurator;
import inet.node.ethernet.Eth100M;


@license(LGPL);
//
// TODO documentation
//
network Network
{
    parameters:
        int n;

        @display("bgb=544,338");
    submodules:
        Host[n]: MyHost {
        }
        //  myHost: MyHost {
        //    @display("p=84,194");
        // }*/
        Server: MyHost {
            @display("p=427,173");
        }
        router: MyRouter {
            @display("p=244,173");
        }
        Configurator: inet.networklayer.configurator.ipv4.Ipv4FlatNetworkConfigurator {
            @display("p=476,35");
        }

    connections:
      //  myHost.ethg++ <--> Eth100M <--> router.ethg++;
        for i=0..n-1 {
            Host[i].ethg++ <--> Eth100M <--> router.ethg++;
        }
        router.ethg++ <--> Eth100M <--> Server.ethg++;



}

