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

## Customizing for Your Environment

1. **Update `variables.tf`**

   Each environment (e.g., `dev`, `prod`) has its own `variables.tf` file under its directory (e.g., `infra-live/dev/variables.tf`).  
   Edit this file to set values specific to your environment:

   - `region`: AWS region to deploy resources (e.g., `ap-south-1`, `us-east-1`)
   - `base_domain`: The DNS base domain (e.g., `demo-kops.local` or your Route53 zone like `example.com`)
   - Any other variables defined in your module

   Example:
   ```hcl
   // variables.tf
   variable "region" {
     default = "ap-south-1"
   }

   variable "base_domain" {
     default = "demo-kops.local"
   }
   ```

   > **Note:** For production, ensure you use your actual Route53 public zone for `base_domain`.

2. **Run Makefile Commands**

   After updating `variables.tf`, run the following commands from your environment directory (e.g., `infra-live/dev`):

   ```bash
   make init      # Initialize Terraform
   make apply     # Apply the Terraform plan
   make outputs   # Show output values
   ```

   These commands will provision infrastructure as per your updated variables.

## Directory Structure

```
infra-live/
  ├── dev/
  │   ├── variables.tf
  │   ├── main.tf
  │   └── ...
  └── prod/
      ├── variables.tf
      ├── main.tf
      └── ...
```

Repeat the above steps for each environment by updating the respective `variables.tf` and running the Makefile commands in that directory.

# infra-live
