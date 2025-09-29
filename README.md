# infra-live
This prototype includes a `dev` stack with pre-filled values for region `ap-south-1` and base domain `demo-kops.local`.
> For real DNS/ACME, change `base_domain` to your Route53 public zone (e.g., example.com).

## Quickstart
```bash
cd infra-live/dev
make init
make apply
make outputs
```
# infra-live
