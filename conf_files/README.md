This contains customized conf files for capev2 (https://github.com/kevoreilly/CAPEv2/tree/master/conf)

What I modified:
- in auxiliary.conf, interface is set to vboxnet0
- in cuckoo.conf, machinery is set to virtualbox
- in cuckoo.conf, resultserver ip is set to 0.0.0.0 - note: this prevents cape/cuckoo from failing to bind at reboot but this also means we need to specify resultserver in virtualbox.conf file
- in virtualbox.conf, resultserver_ip line is uncommented