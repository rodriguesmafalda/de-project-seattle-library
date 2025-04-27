# 📚 Seattle Library Data Pipeline

## 🏩 Overview

This project implements a complete data engineering pipeline to process public checkout data from the Seattle Public Library system.  
It demonstrates modern data engineering practices, including cloud data storage, batch ingestion, data transformation, and visualization.

The project was built as part of a data engineering course to showcase end-to-end automation on a real-world dataset.

---

## 📦 Dataset

- **Source**: [Seattle Public Library – Checkouts by Title](https://data.seattle.gov/Community-and-Culture/Checkouts-by-Title/tmmm-ytt6)
- **Description**: Records of books, eBooks, and other media checked out from Seattle Public Library branches.
- **Subset selected**:
  - **Years**: Selected range (to be defined)
  - **Material Types**: BOOK and EBOOK
  - **Fields**: Title, Author, Checkout Date, Material Type, Library Branch

This subset was chosen to maintain a manageable project size while still allowing meaningful analysis.

---

## 🛠️ Architecture

| Component | Technology |
|:----------|:------------|
| **Data Ingestion** | Python (requests or manual download) |
| **Data Storage** | Google Cloud Storage (GCS) |
| **Data Warehouse** | BigQuery |
| **Orchestration** | Kestra |
| **Transformations** | dbt |
| **Infrastructure as Code** | Terraform |
| **Visualization** | Looker Studio |

---

## 🔄 Data Flow

1. **Extract** checkout records from Seattle Open Data.
2. **Load** the raw CSV file into a GCS bucket.
3. **Ingest** data into BigQuery (raw table).
4. **Transform** data with dbt models (aggregations, clean fields, create marts).
5. **Visualize** checkout trends in Looker Studio dashboards.

---

## 🚀 Infrastructure Deployment

The infrastructure (GCS buckets and BigQuery datasets) is provisioned automatically using **Terraform**.

---

## 📊 Planned Dashboards

- Number of checkouts over time (monthly/yearly trends)
- Top authors and most popular books
- Trends in physical books vs. eBooks
- Popularity by library branch

---

## ⚡ Getting Started

Instructions to run the project locally and on GCP will be added soon!

---

# 👌 Acknowledgments

- Seattle Public Library and Seattle Open Data for providing access to the checkout data.
