<!-- START SLIDE 1 -->

# SLIDE 1: bullets example

## This is a bullet

Some text

## This is another bullet

Some more text



<!-- START SLIDE 2 -->

# SLIDE 2: reference example

## How to cite

For example, WordNet18 is an old dataset [@miller1995wordnet].




<!-- START SLIDE 3 -->

# SLIDE 3: table exmaple

\tiny

|      head       |        relation         |      tail       |
|:---------------:|:-----------------------:|:---------------:|
| __radical_NN_1  |        _part_of         | __molecule_NN_1 |
| __physics_NN_1  | _member_of_domain_topic | __molecule_NN_1 |
| __molecule_NN_1 |        _has_part        |   __atom_NN_1   |
Table: Example table with reference [@miller1995wordnet]



<!-- START SLIDE 4 -->

# SLIDE 4: Math example

## How to add math

In word2vec's skip-gram model, the goal is to maximize the sum log-likelihood given all training vocabulary as target:

$$
\sum_{t=1}^{T}\sum_{c\in C_t} \log p(w_c | w_t)
$$

Where:

$$
p(w_c | w_t) = \frac{exp(w_t^T . w_c)}{\sum_{w_i \in V}{exp(w_t^T w_i)}}
$$



# References
