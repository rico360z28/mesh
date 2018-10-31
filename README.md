# mesh
Mesh setup scripts

Quicker startup from the original https://github.com/Ylianst/MeshCentral


Config Example
{
  "__comment__" : "This is a sample configuration file, edit a section and remove the _ in front of the name. Refer to the user's guide for details.",
  "settings": {
    "_MongoDb": "mongodb://127.0.0.1:27017/meshcentral",
    "_MongoDbCol": "meshcentral",
    "WANonly": true,
    "_LANonly": true,
    "_Minify": 1,
    "_SessionTime": 30,
    "_SessionKey": "MyReallySecretPassword",
    "_Port": 443,
    "RedirPort": 80,
    "_AllowLoginToken": true,
    "_AllowFraming": true,
    "WebRTC": true,
    "ClickOnce": true,
    "SelfUpdate": true,
    "_UserAllowedIP": "127.0.0.1,::1,192.168.0.100",
    "_LocalDiscovery": { "name": "Mesh Server", "info": "Remote Server" }
  },
  "_domains": {
    "": {
      "title": "RicoTC",
      "title2": "Mesh",
      "userQuota": 1048576,
      "meshQuota": 248576,
      "newAccounts": 1,
      "footer": "<a href='https://twitter.com/ricocantrell'>Twitter</a>"
    },
    "customer1": {
      "dns": "customer1.myserver.com",
      "title": "Customer1",
      "title2": "TestServer",
      "newAccounts": 1,
      "auth": "sspi",
      "footer": "Test"
    },
    "info": {
      "share": "C:\\ExtraWebSite"
    }
  },
  "letsencrypt": {
    "email": "mesh@mail.com ",
    "names": "mesh.mail.com",
    "rsaKeySize": 2048,
    "production": true
  },
  "_peers": {
    "serverId": "server1",
    "servers": {
      "server1": { "url": "wss://192.168.2.133:443/" },
      "server2": { "url": "wss://192.168.1.106:443/" }
    }
  },
  "smtp": {
    "host": "smtp.gmail.com",
    "port": 465,
    "from": "alerts@meshmail.com",
    "user": "alerts@meshmail.com",
    "pass": "AwesomePassword",
    "tls": true
  }
}
