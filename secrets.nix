let
  zenbook = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILD5368VF/6IpwYFpPBU76d1B9cFLkkf4UidaZr3QNEz";
  backup = "age1s9lxfsr3d3fv5gkp3gceeamtgwt7nknse74mxxev7yhf9ufeqp4smshaj5";

  allKeys = [
    zenbook
    backup
  ];
in
{
  "secrets/wireguard.age".publicKeys = allKeys;
  "secrets/pgadmin.age".publicKeys = allKeys;
}
