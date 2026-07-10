PLURALS_TABLE = {
  "aircraft"    => "aircraft",
  "analysis"    => "analyses",
  "analytics"   => "analytics",
  "appendix"    => "appendices",
  "audio"       => "audio",
  "bacterium"   => "bacteria",
  "baggage"     => "baggage",
  "basis"       => "bases",
  "bison"       => "bison",
  "buffalo"     => "buffalo",
  "cactus"      => "cacti",
  "child"       => "children",
  "content"     => "content",
  "corpus"      => "corpora",
  "crisis"      => "crises",
  "criterion"   => "criteria",
  "currency"    => "currency",
  "curriculum"  => "curricula",
  "datum"       => "data",
  "deer"        => "deer",
  "diagnosis"   => "diagnoses",
  "die"         => "dice",
  "elk"         => "elk",
  "ellipsis"    => "ellipses",
  "equipment"   => "equipment",
  "feedback"    => "feedback",
  "firmware"    => "firmware",
  "fish"        => "fish",
  "focus"       => "foci",
  "foot"        => "feet",
  "fungus"      => "fungi",
  "furniture"   => "furniture",
  "garbage"     => "garbage",
  "genus"       => "genera",
  "goose"       => "geese",
  "hardware"    => "hardware",
  "hovercraft"  => "hovercraft",
  "hypothesis"  => "hypotheses",
  "index"       => "indices",
  "information" => "information",
  "jeans"       => "jeans",
  "knowledge"   => "knowledge",
  "louse"       => "lice",
  "luggage"     => "luggage",
  "man"         => "men",
  "marketing"   => "marketing",
  "matrix"      => "matrices",
  "medium"      => "media",
  "memorandum"  => "memoranda",
  "metadata"    => "metadata",
  "middleware"  => "middleware",
  "money"       => "money",
  "moose"       => "moose",
  "mouse"       => "mice",
  "music"       => "music",
  "neurosis"    => "neuroses",
  "news"        => "news",
  "nucleus"     => "nuclei",
  "oasis"       => "oases",
  "octopus"     => "octopi",
  "offspring"   => "offspring",
  "ox"          => "oxen",
  "pants"       => "pants",
  "paralysis"   => "paralyses",
  "parenthesis" => "parentheses",
  "person"      => "people",
  "phenomenon"  => "phenomena",
  "police"      => "police",
  "progress"    => "progress",
  "research"    => "research",
  "rice"        => "rice",
  "rubbish"     => "rubbish",
  "salmon"      => "salmon",
  "scissors"    => "scissors",
  "series"      => "series",
  "sheep"       => "sheep",
  "software"    => "software",
  "spacecraft"  => "spacecraft",
  "species"     => "species",
  "spokesman"   => "spokesmen",
  "spokeswoman" => "spokeswomen",
  "squid"       => "squid",
  "staff"       => "staff",
  "stimulus"    => "stimuli",
  "stratum"     => "strata",
  "swine"       => "swine",
  "syllabus"    => "syllabi",
  "synopsis"    => "synopses",
  "thesis"      => "theses",
  "tooth"       => "teeth",
  "traffic"     => "traffic",
  "trousers"    => "trousers",
  "trout"       => "trout",
  "vortex"      => "vortices",
  "watercraft"  => "watercraft",
  "woman"       => "women",
  "zombie"      => "zombies"
}.freeze

def pluralize(word)
  if(word.empty?)
    return word
  end
  word = word.to_s.dup
  pattern_replacement = Array.new
  pattern_replacement << [/([^aeiou])y$/i, '\1ies']
  pattern_replacement << [/(ch|sh|x|s|z)$/i, '\1es']
  pattern_replacement << [/fe$/i, 'ves']
  pattern_replacement << [/([^f])f$/i, '\1ves']
  pattern_replacement << [/$/, 's']
  pattern_replacement.each do |pattern, replacement|
    if(word.gsub!(pattern, replacement))
      break
    end
  end
  return word
end

def to_plural(word)
  key = word.to_s.downcase
  if(PLURALS_TABLE.key?(key))
    return PLURALS_TABLE[key]
  end
  return pluralize(word)
end
