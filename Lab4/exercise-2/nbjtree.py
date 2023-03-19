import copy

from Bio import SeqIO, Phylo
from Bio.Align import MultipleSeqAlignment
from Bio.Phylo import write, BaseTree
from Bio.Phylo.TreeConstruction import DistanceCalculator, DistanceTreeConstructor, DistanceMatrix
from Bio.SeqRecord import SeqRecord

# neighbor-joining algorithm with distancematrix input
def nj(self, distance_matrix):
    """Construct and return a Neighbor Joining tree.

    :Parameters:
        distance_matrix : DistanceMatrix
            The distance matrix for tree construction.

    """
    if not isinstance(distance_matrix, DistanceMatrix):
        raise TypeError("Must provide a DistanceMatrix object.")

    # make a copy of the distance matrix to be used
    dm = copy.deepcopy(distance_matrix)
    # init terminal clades
    clades = [BaseTree.Clade(None, name) for name in dm.names]
    # init node distance
    node_dist = [0] * len(dm)
    # init minimum index
    min_i = 0
    min_j = 0
    inner_count = 0
    # special cases for Minimum Alignment Matrices
    if len(dm) == 1:
        root = clades[0]

        return BaseTree.Tree(root, rooted=False)
    elif len(dm) == 2:
        # minimum distance will always be [1,0]
        min_i = 1
        min_j = 0
        clade1 = clades[min_i]
        clade2 = clades[min_j]
        clade1.branch_length = dm[min_i, min_j] / 2.0
        clade2.branch_length = dm[min_i, min_j] - clade1.branch_length
        inner_clade = BaseTree.Clade(None, "Inner")
        inner_clade.clades.append(clade1)
        inner_clade.clades.append(clade2)
        clades[0] = inner_clade
        root = clades[0]

        return BaseTree.Tree(root, rooted=False)
    while len(dm) > 2:
        # calculate nodeDist
        for i in range(0, len(dm)):
            node_dist[i] = 0
            for j in range(0, len(dm)):
                node_dist[i] += dm[i, j]
            node_dist[i] = node_dist[i] / (len(dm) - 2)

        # find minimum distance pair
        min_dist = dm[1, 0] - node_dist[1] - node_dist[0]
        min_i = 0
        min_j = 1
        for i in range(1, len(dm)):
            for j in range(0, i):
                temp = dm[i, j] - node_dist[i] - node_dist[j]
                if min_dist > temp:
                    min_dist = temp
                    min_i = i
                    min_j = j
        # create clade
        clade1 = clades[min_i]
        clade2 = clades[min_j]
        inner_count += 1
        inner_clade = BaseTree.Clade(None, "Inner" + str(inner_count))
        inner_clade.clades.append(clade1)
        inner_clade.clades.append(clade2)
        # assign branch length
        clade1.branch_length = (
                                       dm[min_i, min_j] + node_dist[min_i] - node_dist[min_j]
                               ) / 2.0
        clade2.branch_length = dm[min_i, min_j] - clade1.branch_length

        # update node list
        clades[min_j] = inner_clade
        del clades[min_i]

        # rebuild distance matrix,
        # set the distances of new node at the index of min_j
        for k in range(0, len(dm)):
            if k != min_i and k != min_j:
                dm[min_j, k] = (
                                       dm[min_i, k] + dm[min_j, k] - dm[min_i, min_j]
                               ) / 2.0

        dm.names[min_j] = "Inner" + str(inner_count)
        del dm[min_i]


# # Define the filenames for the fasta files
filenames = ['German_Neanderthal.fasta', 'Russian_Neanderthal.fasta', 'European_Human.fasta',
             'Mountain_Gorilla_Rwanda.fasta',
             'Chimp_Troglodytes.fasta', 'Puti_Orangutan.fasta', 'Jari_Orangutan.fasta', 'Western_Lowland_Gorilla.fasta',
             'Eastern_Lowland_Gorilla.fasta', 'Chimp_Schweinfurthii.fasta', 'Chimp_Vellerosus.fasta',
             'Chimp_Verus.fasta']

# Create a list to store the sequences
sequences = {}

# Read in the fasta files and add the sequences to the list
for filename in filenames:
    with open(filename) as file:
        for record in SeqIO.parse(file, 'fasta'):
            sequences[record.id] = str(record.seq)

# Determine the shortest sequence length
min_length = min([len(seq) for seq in sequences.values()])

msa = MultipleSeqAlignment([])
# Truncate all sequences to the shortest length
for name, seq in sequences.items():
    sequences[name] = seq[:min_length]
    print(name + ":\n")
    print(sequences[name] + "\n")
    msa.append(SeqRecord(id=name, seq=sequences[name]))
print(msa)

calculator = DistanceCalculator('identity')

# distance_matrix = calculator.get_distance(sequences.values())
distance_matrix = calculator.get_distance(msa)

"""
AF011222.1  0.000000
AF254446.1  0.693215    0.000000
X90314.1    0.710914    0.705015    0.000000
AF089820.1  0.702065    0.740413    0.474926    0.000000
AF176766.1  0.743363    0.713864    0.672566    0.666667    0.000000
AF451972.1  0.722714    0.663717    0.731563    0.746313    0.628319    0.000000
AF451964.1  0.719764    0.693215    0.731563    0.722714    0.657817    0.713864    0.000000
AY079510.1  0.725664    0.737463    0.480826    0.436578    0.705015    0.719764    0.734513    0.000000
AF050738.1  0.710914    0.740413    0.483776    0.053097    0.678466    0.737463    0.746313    0.442478    0.000000
AF176722.1  0.737463    0.696165    0.687316    0.663717    0.474926    0.696165    0.643068    0.684366    0.678466    0.000000
AF315498.1  0.734513    0.675516    0.687316    0.681416    0.663717    0.713864    0.672566    0.651917    0.684366    0.687316    0.000000
AF176731.1  0.716814    0.693215    0.678466    0.660767    0.289086    0.660767    0.643068    0.693215    0.663717    0.300885    0.681416    0.000000
"""

# print the lib distance matrix map()
print(distance_matrix)

# Create an neighbor-joining tree from the distance matrix
constructor = DistanceTreeConstructor()
tree = constructor.nj(distance_matrix)

Phylo.draw(tree)
# Write the tree to a csv file
# A CS way represent node and edge
write(tree, 'ultrametric_tree_nbj.csv', 'nexml')
