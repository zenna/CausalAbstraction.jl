### A Pluto.jl notebook ###
# v0.18.0

using Markdown
using InteractiveUtils

# ╔═╡ ee67296c-89dd-11ec-3bd7-95f3356d39ec
import Pkg

# ╔═╡ 5c0fa590-327e-4245-a00a-83f0a81c90b5
Pkg.activate(Base.current_project())

# ╔═╡ 3fe3a7de-e480-47e9-a4ed-f1ca26624d6e
using Omega

# ╔═╡ 92c6c4e1-937f-41a0-8bba-9dbc174ecfad
using Distributions

# ╔═╡ 734fc177-34ff-4801-9745-53667984d062
md"""## Notes

There arae a few things that would be nice:

1. be able to abstractly define things before instantiating them.  E.g. here's what a policy is..
2. be able to instantiate as late as possible, and in different ways if need be.
"""


# ╔═╡ a5e4b6db-b402-4697-bc5f-5340f36f4c23
md"""### Given models

$\mu(s,a)=s'$ is the (microscopic) model of taking action $$a$$ in state $$s$$ and getting to state $$s'$$. For simplicity let's assume its deterministic."""

# ╔═╡ 5ff60360-4d60-4c84-947f-0dec5dfa3b0c
md""" ### To Learn

$$\pi(\vec{a}|b,s) - a$$ microscopic control policy conditions on concrete state $$s$$ and abstract action $$b$$. $The control policy decomposes as:
"""

# ╔═╡ 0014efe5-2edb-464a-91ad-bfc44ba4a504
π(â, s) = "some random variable" # What kind of thing is π, either a conditional

# ╔═╡ 0f030ffd-6407-47eb-ab23-566fd0006397
md"""
Let's learn a very simple prior over the abstract actions which simply assumes that the number of abstract actions follows a geometric distribution with (learned) parameter $\lambda$ and a categorical distribution over each abstract action $P_b(\cdot )$
"""

# ╔═╡ edaba18e-544e-4442-918b-a39bb1a208ac
Unit = StdUniform{Float64}()

# ╔═╡ 9817aac3-9745-4bdb-8835-f53183456f35
λ = :λ ~ Unit

# ╔═╡ 956d3791-6582-4c88-8697-3791015b7f8d
b⃗_len = @~ Geometric.(λ)

# ╔═╡ 47237bab-bd6b-490d-bb15-06f1d542f06c
randsample(b⃗_len)

# ╔═╡ 5ff2d2b2-9f59-42f6-96c0-eb46b60bd161
Pᵦ(i, ω) = 3

# ╔═╡ 03a0aa18-9e88-46fa-ae2f-afaf64f0bb75
b⃗ = map(Pᵦ, (:).(1, b⃗_len))

# ╔═╡ 6d051c43-f240-48ee-b89b-d8389af18365


# ╔═╡ Cell order:
# ╠═ee67296c-89dd-11ec-3bd7-95f3356d39ec
# ╠═5c0fa590-327e-4245-a00a-83f0a81c90b5
# ╠═3fe3a7de-e480-47e9-a4ed-f1ca26624d6e
# ╠═92c6c4e1-937f-41a0-8bba-9dbc174ecfad
# ╠═734fc177-34ff-4801-9745-53667984d062
# ╠═a5e4b6db-b402-4697-bc5f-5340f36f4c23
# ╠═5ff60360-4d60-4c84-947f-0dec5dfa3b0c
# ╠═0014efe5-2edb-464a-91ad-bfc44ba4a504
# ╠═0f030ffd-6407-47eb-ab23-566fd0006397
# ╠═edaba18e-544e-4442-918b-a39bb1a208ac
# ╠═9817aac3-9745-4bdb-8835-f53183456f35
# ╠═956d3791-6582-4c88-8697-3791015b7f8d
# ╠═47237bab-bd6b-490d-bb15-06f1d542f06c
# ╠═5ff2d2b2-9f59-42f6-96c0-eb46b60bd161
# ╠═03a0aa18-9e88-46fa-ae2f-afaf64f0bb75
# ╠═6d051c43-f240-48ee-b89b-d8389af18365
