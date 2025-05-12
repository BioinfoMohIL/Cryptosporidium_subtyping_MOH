🦠 Cryptosporidium gp60 Subtype Finder

This project helps to determine Cryptosporidium subtypes based on the gp60 gene using 
local or online BLAST (via NCBI).  
It provides two Python scripts to manage and query a gp60 subtype database.


------------------------------------------------------------

📇 Data & Database

The data is imported from two main sources: the NCBI database and the BioNumerics Cryptosporidium database.

We maintain two key databases:

Specimen_db:
Contains species information, including species names and their corresponding families.
    → This database is not used by the script; it exists solely for tracking and documentation purposes.

Subtypes_db:
This is essential for building the gp60_db, which is used by the script.
    → It includes FASTA files named according to the family and gene of interest.
For example:
    >Cryptosporidium_parvum_IIh_gp60

------------------------------------------------------------

🔧 Features

- Create or extend a local gp60 BLAST database.
- Run BLAST (locally or online) to find the closest gp60 subtype.
- Output results as a CSV file.


------------------------------------------------------------

[ How the DB is build in the container]

🧬 Step 1: Build or Extend Your Database

Use `add_to_gp60_db.py` to create or add FASTA sequences to the gp60 subtype database:

    python add_to_gp60_db.py --i <input_fasta_dir> --db_name <db_name> [--o <output_dir>]

Arguments:
    --i (str) : Input directory containing your FASTA files.
    --db_name (str) : Name for your BLAST database (e.g. gp60_db).
    --o (str, optional) : Output directory where the processed database will be stored.


------------------------------------------------------------


🔍 Step 2: Find Subtypes from New Sequences

📦 Requirements
    Python 3.7+
    Biopython
    BLAST+

Install dependencies:
    pip install biopython
    
    Install BLAST+ locally:
    https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/


Use find_subtype.py to run BLAST (local or online) and determine the closest subtype:

    python crypto_find_subtype.py --i <input_fasta_dir> --db <db_dir> [--live]

Arguments
    --i (str) : Input directory containing FASTA files to identify.
    --species_file, required=True, help="Species filename (.txt)")
    --best_hit_file, required=True, help="Best hit filename (.txt)")
    --family_file, required=True, help="Family filename (.txt)")
    --subtype_file, required=True, help="Subtype filename (.txt)")
    --tct_file, required=True, help="T (TCT) filename (.txt)")
    --tca_file, required=True, help="A (TCA) filename (.txt)")
    --tcg_file, required=True, help="G (TCG) filename (.txt)")
    --rep_file, required=True, help="R (Rep sequence) filename (.txt)")


📄 Output
    TXT files will be generated.




✅ Example (to get the values in the terra table, need to create txt for each values)
    python3 crypto_find_subtype --i ~{gene_fasta} --species_file species.txt --best_hit_file best_hit.txt --family_file family.txt --subtype_file subtype.txt --tct_file tct.txt --tca_file tca.txt --tcg_file tcg.txt --rep_file rep.txt


