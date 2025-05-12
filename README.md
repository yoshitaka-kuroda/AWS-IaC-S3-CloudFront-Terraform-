# Terraform Static Site on AWS

このリポジトリは、TerraformによるAWS上の静的Webサイトホスティングのサンプル構成を示します。

## 🛠️ 環境構築

- **OS／環境**: Windows 11 + WSL2 (Ubuntu 22.04)  
- **エディタ**: Visual Studio Code (Remote-WSL)  
- **CLI**: AWS CLI v2 (profile: `personal`)  
- **IaC**: Terraform v1.8.3  

## ⚙️ リソース構成

1. **S3バケット**: 静的ファイル（`index.html`, `404.html`）ホスティング  
2. **CloudFront OAI**: S3バケットをCloudFront限定アクセスに設定  
3. **S3バケットポリシー**: OAIにのみ `s3:GetObject` を許可  
4. **CloudFrontディストリビューション**  
   - HTTPS 配信（`redirect-to-https`）  
   - デフォルトルートオブジェクト: `index.html`  
   - カスタムエラーページ: `404.html` (404 応答)  
   - PriceClass_100  

## 📂 ディレクトリ構成

aws-terraform-project/
├── environments/
│   └── dev/
│       ├── s3.tf
│       ├── cloudfront_oai.tf
│       ├── bucket_policy.tf
│       └── cloudfront_distribution.tf
├── site-content/
│   ├── index.html
│   └── 404.html
└── README.md

## 🚀 デプロイ手順

```bash
cd ~/aws-terraform-project/environments/dev
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
