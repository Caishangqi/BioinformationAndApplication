## Exercise 2


### question 2.1
What scores and statistics BLAST use? What does each one means and how is
it calculated?

BLAST uses statistical theory and generate bit score and expect value (E-value). The bit score give how good of it alignment, high bit score means better alignment. bit score calculate from substitution matrix. The "substitution matrix" is an essential factor in this calculation as it provides a score for matching any conceivable pair of residues.

The E-value provides information about the statistical relevance of a specific pairwise alignment and takes into account both the size of the database and the scoring system employed. A smaller E-value implies a stronger match.

### question 2.2
What is the difference between BLAST, BLAST 2, PSI-BLAST, FASTA? When
should each of these been used (trade-offs)?

- BLAST works by breaking down the query sequence into smaller segments, called words or seeds, and using these segments to search for similar sequences in the database.
- BLAST 2 is a version of BLAST that allows the comparison of two sequences, rather than a sequence and a database. It is useful for comparing two sequences that may have a common ancestor or for identifying conserved domains in related sequences.

- PSI-BLAST is a modification of the BLAST algorithm that is designed to identify more distant homologs.PSI-BLAST is useful for identifying more distant homologs and for detecting conserved domains in divergent sequences.

- FASTA is another algorithm used for sequence similarity search. Like BLAST, FASTA uses a seed-and-extend approach to identify similar sequences. However, it differs from BLAST in that it uses a heuristic algorithm to align sequences, rather than relying on a scoring matrix. FASTA is particularly useful for identifying local similarities, such as short conserved domains or motifs.

### question 2.3
Read: [this](http://www.ncbi.nlm.nih.gov/BLAST/tutorial/Altschul-1.html) And explain what is the p-value for the top match of the following query (that comes from the movie Jurassic  Park) :

p-value = 0.103 is less than the significance level (typically 0.05), then the result is not considered statistically significant