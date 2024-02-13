respuesta =  "1) ¿Quién fue el primer presidente de Chile?\na) R: Bernardo O'Higgins.\nb) Diego Portales.\nc) Arturo Alessandri.\n\n2) ¿En qué año se produjo la Independencia de Chile?\na) 1818.\nb) 1911.\nc) 1945.\nR: 1818.\n\n3) ¿Cuál de los siguientes líderes chilenos fue conocido como \"El Libertador\"?\na) José Miguel Carrera.\nR: Bernardo O'Higgins.\nc) Manuel Rodríguez.\n\n4) ¿Quién fue el último presidente de Chile durante la dictadura militar?\na) Salvador Allende.\nb) Augusto Pinochet.\nR: Patricio Aylwin.\n\n5) ¿Cuál fue la figura principal en la lucha por los derechos de las mujeres en Chile?\na) Gabriela Mistral.\nR: Elena Caffarena.\nc) Violeta Parra."

respuesta = respuesta.split("\n").reject {|element| element == ""}
question = nil
alternatives = []
respuesta.each do |element|
  if element.end_with?("?")
    question = element
  elsif element.match?(/[a-c]\)/)
    alternatives << element
  end
end

p question
p alternatives