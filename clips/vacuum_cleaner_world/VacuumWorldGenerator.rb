#!/usr/bin/en ruby

# VacuumWorldGenerator, Copyright 2013 Roberto 'psicomante' Pesando
# Released under GPL v2 license
# http://choosealicense.com/licenses/gpl-v2/

# USE
# VacuumWorldGenerator -l 5 -v 4
#
# ARGV.each do|a|
#  puts "Argument: #{a}"
# end

ARGV_MINIMUM_LENGTH = 1
ARGV_MAXIMUM_LENGTH = 4
DEFAULT_WORLD_FACT_NAME = "cell"
DEFAULT_VACUUM_FACT_NAME = "vacuum"

COMMANDS = {
  {:short => 'l', :long => 'length', :style => 'unix', :type => 'numeric'},
  {:short => 'v', :long => 'cleanerposition', :style => 'unix', :type => 'numeric'}
}

STATUSES = ['dirty', 'clean']

def check_numeric_param(param)
  return param.to_i > 0
end

# gets the script file name (wow, witty!)
def getScriptFileName()
  return File.basename($0)
end

# prints help
# TODO: print automatically the help
def printHelp(display_error = false)

  # scope variables
  programName = getScriptFileName()

  definitionString = "#{programName} is a 'Vacuum Cleaner World Generation Tool for CLIPS language' "
  howToUseString = "HOW TO USE: #{programName} [-l | --length] <world-length> [[-v | --cleanerposition] <vacuum-position>]"
  separator = ""

  # build the separator line
  howToUseString.length.times do
    separator << "="
  end

  # prints help
  if (display_error)
    puts "-- error: #{display_error}"
  end
  puts "\n" + definitionString
  puts separator
  puts howToUseString
  puts separator

end

# print all the arguments
def printARGVs()
  ARGV.each do|a|
    puts "Argument: #{a}"
  end
end

# checks the arguments length
def checkARGVs()

  # length
  if (ARGV.length < 1 || ARGV.length > 4)
    printHelp("wrong number of arguments")
    exit()
  end

  # <script> ciao
  # #"ciao".to_i == 0
  if (ARGV.length == 1 && ARGV[0].to_i > 0)
    return ARGV[0].to_i
  end

  if (ARGV.length == 2 && (ARGV[0].to_i > 0 && ARGV[1].to_i > 0))
    return ARGV[0].to_i, ARGV[1].to_i
  end

  if (ARGV.length == 2 && (ARGV[0] == '-l' && ARGV[1].to_i > 0))
    return ARGV[1].to_i
  end

  if (ARGV.length == 4 && (ARGV[0] == '-l' && ARGV[1].to_i > 0) && (ARGV[2] == '-v' && ARGV[3].to_i > 0))
    return ARGV[1].to_i, ARGV[3].to_i
  end

  printHelp("wrong arguments")
  exit()
end

# TODO: creates a buildAllowedParams
def checkARGVengine()
  # length
  if (ARGV.length < 1 ||  ARGV.length > COMMANDS.length * 2)
    printHelp("Wrong Number of Parameters")
    exit()
  end

  if (ARGV.length == COMMANDS.length*2)

  end

end

def buildWallFact(id)
  return buildWorldFact(id, "wall")
end

def randomizeStatus()
  return rand(STATUSES.length)
end

def buildWorldFact(id, status)
  return "(#{DEFAULT_WORLD_FACT_NAME} (coord #{id}) (status #{status}) )\n"
end

def buildVacuumFact(position)
  return "(#{DEFAULT_VACUUM_FACT_NAME} (position #{position}) (direction right) )\n"
end


# main
if (__FILE__ == $0)

  #printARGVs()

  worldClipsCode = ''
  worldLength, vacuumPosition = checkARGVs()

  # randomize vacuum position (0,worldLength)
  if (vacuumPosition == nil)
    vacuumPosition = 1 + rand(worldLength-1)
  end

  # open deffacts
  worldClipsCode << "(deffacts worldmap \n"

  # vacuum position
  worldClipsCode << buildVacuumFact(vacuumPosition)

  puts "World Length: #{worldLength}"
  puts "Vacuum Position: #{vacuumPosition}"

  # left wall
  worldClipsCode << buildWallFact(0)

  worldLength.times do |id|
    if (id > 0 && id < worldLength - 1)
      worldClipsCode << buildWorldFact(id, STATUSES[randomizeStatus()])
    end
  end

  # right wall
  worldClipsCode << buildWallFact(worldLength - 1)

  # close deffacts
  worldClipsCode << ")"

  File.open('WorldMap.clp', 'w') { |file| file.write(worldClipsCode) }
end

