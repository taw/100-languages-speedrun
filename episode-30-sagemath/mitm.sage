#!/usr/bin/env sage

# "Export Grade" Diffie-Hellman Key Exchange
K = GF(57702167561280060733)
g = K(2)

# We don't know these numbers, CTF server does
secret_a = 21994334292003664313
secret_b = 5307079022839176516

# What we get from the challenge is these:
# Alice sent to Bob: g^a
# Bob sent to Alice: g^a
ga = K(20214349094702392183)
gb = K(36652172046887073403)

# This is fast only because SageMath knows all the fancy algorithms
# It would be completely non-viable to brute force
# and extremely tedious and slow to code yourself:
a = discrete_log(ga, g)
gab = gb ^ a
print(f"We hacked the key: {gab}")

# CTF server can verify our solution:
print(f"Alice shared key: {gb^secret_a}")
print(f"Bob shared key: {ga^secret_b}")
