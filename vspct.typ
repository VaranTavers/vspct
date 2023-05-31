// Varan's simple Pseudocode for Typst

#let lang = "en"

#let pkeywords = (
  en: (
    if_pre: "if",
    if_post: "",
    while_pre: "while",
    while_post: "",
    do_start: "repeat",
    do_end_pre: "until",
    do_end_post: "",
    end_pre: "end",
    end_post: "",
    else_pre: "else",
    return_pre: "return",
    for_pre: "for",
    for_post: "",
    in_pre: "In",
    out_pre: "Out",
    algorithm_pre: "Algorithm",
    algorithm_post: "",
  ),
  hu: (
    if_pre: "Ha",
    if_post: "akkor",
    while_pre: "Amíg",
    while_post: "végezd el",
    do_start: "Ismételd",
    do_end_pre: "Ameddig",
    do_end_post: "",
    end_pre: "",
    end_post: "vége",
    else_pre: "különben",
    return_pre: "térít",
    for_pre: "Minden",
    for_post: "végezd el",
    in_pre: "Be",
    out_pre: "Ki",
    algorithm_pre: "Algoritmus",
    algorithm_post: "",
  )
)

#let gets = sym.arrow.l.long

#let algCounter = counter("alg")
#let pseudo(body, caption: "") = {
  block(
    breakable: false,
    {
    set align(left)
    strong[
      #pkeywords.at(lang).at("algorithm_pre") #algCounter.display()#pkeywords.at(lang).at("algorithm_post")
    ]
    ": " + caption
    algCounter.step()
    block(
      breakable: false,
      stroke: (top: black, bottom: black),
      above: 0.4em,
      inset: (top: 0.5em, left: 1em, right: 1em, bottom:0.5em),
      par(
        leading: 0.5em,
        body
      )
    )
  }
  )
}


#let pblock(fname_pre, fname_post, f, body) = {
  text(weight: "bold", fname_pre)+" "+f+" "+text(weight: "bold",fname_post)
  block(
    above: 0.7em,
    below: 0.5em,
    inset: (top: 0em, left: 1em),
    par(
      leading: 0.5em,
      body
    )
  )
  text(weight: "bold", pkeywords.at(lang).at("end_pre") + " " + fname_pre + " " + pkeywords.at(lang).at("end_post"))
}

#let pfor(iterator, start, end, cumul: "", body) = {
  text(weight: "bold", pkeywords.at(lang).at("for_pre"))+" "+iterator+" "+gets+" "+start+", "+end
  if cumul != "" {
    ", " + cumul
  }
  " "
  text(weight: "bold", pkeywords.at(lang).at("for_post"))
  block(
    above: 0.7em,
    below: 0.5em,
    inset: (top: 0em, left: 1em),
    par(
      leading: 0.5em,
      body
    )
  )
  text(weight: "bold", pkeywords.at(lang).at("end_pre") + " " + pkeywords.at(lang).at("for_pre") + " " + pkeywords.at(lang).at("end_post"))
}

#let prepeat(f, body) = {
  text(weight: "bold", pkeywords.at(lang).at("do_start"))
  block(
    above: 0.7em,
    below: 0.5em,
    inset: (top: 0em, left: 1em),
    par(
      leading: 0.5em,
      body
    )
  )
  text(weight: "bold", pkeywords.at(lang).at("do_end_pre")+ " " + f + " " + pkeywords.at(lang).at("do_end_post"))
}

#let pwhile(f, body) = pblock(pkeywords.at(lang).at("while_pre"), pkeywords.at(lang).at("while_post"), f, body)

#let pif(f, body) = pblock(pkeywords.at(lang).at("if_pre"), pkeywords.at(lang).at("if_post"), f, body)

#let pifelse(f, body1, body2) = {
  text(weight: "bold", pkeywords.at(lang).at("if_pre"))+" "+f+text(weight: "bold",pkeywords.at(lang).at("if_post"))
  block(
    above: 0.7em,
    below: 0.5em,
    inset: (top: 0em, left: 1em),
    par(
      leading: 0.5em,
      body1
    )
  )
  text(weight: "bold", pkeywords.at(lang).at("else_pre"))
    block(
    above: 0.7em,
    below: 0.5em,
    inset: (top: 0em, left: 1em),
    par(
      leading: 0.5em,
      body2
    )
  )
  text(weight: "bold", pkeywords.at(lang).at("end_pre")+" "+pkeywords.at(lang).at("if_pre")) + " " + pkeywords.at(lang).at("end_post")
}

#let preturn(body) = {
  text(weight: "bold", pkeywords.at(lang).at("return_pre")) + " " + body
}

#let pin(body) = {
  text(weight: "bold", pkeywords.at(lang).at("in_pre")) + " " + body
}

#let pout(body) = {
  text(weight: "bold", pkeywords.at(lang).at("out_pre")) + " " + body
}

#let pref(label) = pkeywords.at(lang).at("algorithm_pre") + " " + locate(loc => {
  algCounter.at(
    query(label, loc).first().location()
  ).at(0)
}) + " " + pkeywords.at(lang).at("algorithm_post")

/*
#show figure: it => if rev [
  #set align(left)
  #strong[
    #it.supplement
    #it.counter.display(it.numbering)
  ]:
  #it.caption
  #it.body
] else [
  #set align(center)
    #it.body
    #emph[
      #it.supplement
      #it.counter.display(it.numbering)
    ]: #it.caption
]
*/