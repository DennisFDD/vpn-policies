resource "ibm_pi_ike_policy" "ikepol8" {    
  pi_cloud_instance_id    = "42175bd4-dc42-4ce0-ac6f-bc55caac4b7c"
  pi_policy_name          = "ikepol8"    
  pi_policy_dh_group = 20   
  pi_policy_encryption = "aes-256-cbc"  
  pi_policy_key_lifetime = 28800    
  pi_policy_preshared_key = "falabella"    
  pi_policy_version = 2     
  pi_policy_authentication = "sha-256"
}  

resource "ibm_pi_ipsec_policy" "ipsecpol8" {
  pi_cloud_instance_id    = "42175bd4-dc42-4ce0-ac6f-bc55caac4b7c"
  pi_policy_name          = "ipsecpol8"
  pi_policy_dh_group = 20
  pi_policy_encryption = "aes-256-cbc"
  pi_policy_key_lifetime = 28800
  pi_policy_pfs = true
  pi_policy_authentication = "hmac-sha-256-128"
}

resource "time_sleep" "wait_3_seconds" {
  create_duration = "300s"
}

resource "ibm_pi_vpn_connection" "vpndfd2" {
  pi_cloud_instance_id    = "42175bd4-dc42-4ce0-ac6f-bc55caac4b7c"  
  pi_vpn_connection_name  = "vpndfd2"
  pi_ike_policy_id        = "ikepol8"
  pi_ipsec_policy_id      = "ipsecpol8"
  pi_vpn_connection_mode  = "route"
  pi_networks             = ["testvpn"]
  pi_peer_gateway_address = "169.46.19.238"
  pi_peer_subnets         = ["10.177.131.192/26"]
}

