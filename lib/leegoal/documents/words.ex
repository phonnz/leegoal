defmodule Leegoal.Documents.Words do
  @words [
    "Plaintiff",
    "Defendant",
    "Contract",
    "Tort",
    "Crime",
    "Jurisdiction",
    "Statute",
    "Regulation",
    "Constitution",
    "Amendment",
    "Felony",
    "Misdemeanor",
    "Arrest",
    "Indictment",
    "Arraignment",
    "Trial",
    "Verdict",
    "Sentence",
    "Breach of contract",
    "Negligence",
    "Personal injury",
    "Property damage",
    "Burden of proof",
    "Damages",
    "Injunction",
    "Divorce",
    "Child custody",
    "Child support",
    "Spousal support",
    "Corporation",
    "LLC",
    "Partnership",
    "Sole proprietorship",
    "Contract law",
    "Securities law",
    "Intellectual property law"
  ]

  def new_word() do
    Enum.random(@words)
  end

  def new_content() do
    Enum.take_random(@words, 5)
  end
end
