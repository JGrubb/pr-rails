class Quiz
  attr_accessor :score
  attr_accessor :answers
  attr_accessor :passed
  
  # Set up the Score as an Array
  def initialize(answers)
    @answers = answers
    @score = 0
    @passed = false
  end

  # Define Your Questions Here - static method so pull using Quiz::questions
  def self.questions
    { 
      0 => "Which of the following best describes PlantRight?",
      1 => "Among their many impacts to the natural environment, invasive plants can cause harm by:",
      2 => "What traits commonly characterize both invasive plants and hardy ornamental plants?",
      3 => "The most cost effective way to prevent new plant invasions from occurring is:",
      4 => "Which of the following horticultural plants are not included as invasives on PlantRight's list?",
      5 => "While invasive plants can be beautiful when they bloom in the landscape, their presence brings adverse consequences. Invasive broom plants, like French broom and Scotch broom, are problematic because they are:",
      6 => "To be a PlantRight Partner, retail stores must:",
      7 => "A plant may be invasive in one region of the state but not in another due to climatic differences.",
      8 => "Almost half of all invasive plant introductions to California are a result of ornamental plants brought here for horticulture purposes.",
      9 => "All plants that pose risk of becoming invasive in California have already been introduced to the state."
    }
  end
  
  # Define Your Choices Per Question Here, maintain order - static method so pull using Quiz::choices
  def self.choices
    { 
      0 => ["A nonprofit organization that boycotts nurseries and landscapers who sell invasive plants for gardening and landscaping purposes.","A project that works collaboratively with California's nursery industry to find science-based, and non-regulatory solutions to the introduction of horticultural invasive plants.","A program that was established to promote nurseries that stop selling invasive plants in California.","A committee of nursery representatives who believe that noninvasive plants are the better choice for gardens and landscapes."],
      1 => ["Degrading habitat normally used for foraging and nesting by wildlife","Altering both soil composition and natural hydrologic cycles","Increasing the frequency and intensity of fire regimes","All of the above"],
      2 => ["Matures quickly","Tolerant of a wide range of soil and weather conditions","Resistant to pests and disease","All of the above"],
      3 => ["Foliar sprays of densely invaded sites using glyphosate","Recognizing and intercepting the invasive plant before it is introduced to the wild","Real-time mapping of the plants' spread","Planting native plants"],
      4 => ["Scotch broom (<em>Cytisus scoparius</em>), Green fountain grass (<em>Pennisetum setaceum</em>), and Crystalline iceplant (<em>Mesembryanthemum crystallinum</em>)","Pampas grass (<em>Cortaderia Selloana</em>), Giant reed (<em>Arundo donax</em>), and Highway Iceplant (<em>Carpobrotus edulis</em>)","Chinese pistache (<em>Pistacia chinensis</em>), Giant rye (<em>Leymus condensatus</em>), and Western redbud (<em>Cercis occidentalis</em>).","Saltcedar (<em>Tamarix ramosissima</em>), Chinese tallow tree (<em>Sapium sebiferum</em>), and Periwinkle (<em>Vinca major</em>)"],
      5 => ["Poor at preventing erosion, crowd out neighboring plant species, and damage aquatic biodiversity by overwhelming waterways.","Known for raising sidewalks with their roots, catch fire easily, and have persistent seed banks.","Major agricultural weeds, poor pollinator plants, and alter soil composition.","Toxic to wildlife, highly flammable, and alter soil composition."],
      6 => ["Contribute local knowledge to PlantRight about plants that are invasive in their region.","Agree not to sell the plants that PlantRight lists as invasive in their region.","Ask their neighboring nurseries and suppliers to stop selling invasive plants.","Participate in annual training sessions about invasive plants."],
      7 => ["True","False"],
      8 => ["True","False"],
      9 => ["True","False"]
    }
  end
  
  # Define Your Correct Answers Here
  def correct_answers
    {
      0 => "A project that works collaboratively with California's nursery industry to find science-based, and non-regulatory solutions to the introduction of horticultural invasive plants.",
      1 => "All of the above",
      2 => "All of the above",
      3 => "Recognizing and intercepting the invasive plant before it is introduced to the wild",
      4 => "Chinese pistache (<em>Pistacia chinensis</em>), Giant rye (<em>Leymus condensatus</em>), and Western redbud (<em>Cercis occidentalis</em>).",
      5 => "Toxic to wildlife, highly flammable, and alter soil composition.",
      6 => "Agree not to sell the plants that PlantRight lists as invasive in their region.",
      7 => "True",
      8 => "True",
      9 => "False"
    }
  end

  # Grade the quiz.
  def grade
    @score_info = []
    if @answers 
      @answers.each do |key, value|
        score = grade_question(key, value)
        @score_info << key if score != 1
      end
    end
    @score_info
  end
  
  # Grade a single question
  def grade_question(key, value)
    @score += 1 if value == correct_answers[key.to_i]
  end
  
  # Boolean as to whether the user passed or not
  def passed?
    @passed = (@score >= 4 ? true : false)
  end
end
