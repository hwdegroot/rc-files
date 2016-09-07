// Use with tunnelswitch
// Allow proxying through ssh tunnel 
// ssh -ND 1080 <remote host>

function FindProxyForURL(url, host)
{
    url = url.toLowerCase();
    host = host.toLowerCase();

    // whole site
    var site_list = [
        ,'rnd.hq.mendix.net'
        ,'srv.hq.mendix.net'
    ];

    var exp_list = [ ];

    for(var index = 0;index<site_list.length;index++){
         if(host==site_list[index] ||
             shExpMatch(host, "*." + site_list[index])){
            return "SOCKS5 127.0.0.1:1080";
         }
    }
    for(var index = 0;index<exp_list.length;index++){
        var re = new RegExp(exp_list[index]);
        if(url.match(re)){
            return "SOCKS5 127.0.0.1:1080";
        }
    }
    return "DIRECT";
}
