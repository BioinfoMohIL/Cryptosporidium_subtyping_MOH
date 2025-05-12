version 1.0

workflow crypto_gp60_subtype {
    meta {
        description: "Cryptosporidium gp60 Subtyping"
        author: "David Maimoun"
        organization: "MOH Jerusalem"
    }

    input {
        File gene_fasta 
    }

    call find_subtype {
        input:
            gene_fasta = gene_fasta
    }

    output {
        String species  = find_subtype.species
        String best_hit = find_subtype.best_hit
        String family   = find_subtype.family
        String subtype  = find_subtype.subtype
        String tct      = find_subtype.tct
        String tca      = find_subtype.tca
        String tcg      = find_subtype.tcg
        String rep      = find_subtype.rep
    }

   
}

task find_subtype {
    input {
        File gene_fasta
        String docker = 'bioinfomoh/crypto_find_subtype:1'
    }

    command <<<
        
        crypto_find_subtype --i ~{gene_fasta} --species_file species.txt --best_hit_file best_hit.txt --family_file family.txt --subtype_file subtype.txt --tct_file tct.txt --tca_file tca.txt --tcg_file tcg.txt --rep_file rep.txt
    >>>

    output {
        String species  = read_string('species.txt')
        String best_hit = read_string('best_hit.txt')
        String subtype  = read_string('subtype.txt')
        String family   = read_string('family.txt')
        String tct      = read_string('tct.txt')
        String tca      = read_string('tca.txt')
        String tcg      = read_string('tcg.txt')
        String rep      = read_string('rep.txt')
    }

    runtime {
        docker: docker
    }
}
