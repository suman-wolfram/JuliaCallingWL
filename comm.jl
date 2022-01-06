t = Template(;
           user="sumanb",
           license="MIT",
           authors=["Suman Banerjee"],
           dir="~/code",
           julia_version=v"0.7",
           ssh=true,
           plugins=[
           ],
       )

       generate("WolframEvaluate", t)