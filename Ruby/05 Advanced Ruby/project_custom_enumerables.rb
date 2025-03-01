# Debes estar muy familiarizado con el módulo Enumerable, que se combina con las clases Array y Hash (entre otras) y te proporciona muchos métodos iterativos útiles. Para demostrar que no hay magia en ello, vas a reconstruir esos métodos.
#
# Explicaremos un ejemplo de cómo funciona un enumerable para darte una idea de cómo empezar a abordar estos métodos. En concreto, vamos a desglosar el #findmétodo enumerable. El #findmétodo encuentra el primer elemento que coincide con la condición del bloque indicado y lo devuelve. Si no se encuentra ninguno, devuelve nil.

# a = [1, 2, 3, 4]
# a.find { |n| n == 2 }
# # results in `2`
#
# a.find { |n| n == 10 }
# # results in `nil`

# Ahora la pregunta es ¿cómo reconstruiríamos este método usando nuestro conocimiento de yield y blocks? Repasemos el ejemplo que se muestra a continuación línea por línea.
#
# module Enumerable
#   def my_find
#     self.each do |elem|
#       return elem if yield(elem)
#     end
#
#     nil
#   end
# end
#
# a = [1, 2, 3]
# a.my_find { |n| n == 2 }
# #=> 2
#
# En primer lugar, vamos a hacer algo que quizás no hayas visto antes: manipular una clase o un módulo existente en el lenguaje Ruby. Ruby te permite hacer esto. Podemos volver a abrir el Enumerablemódulo y agregar allí nuestros métodos personalizados.
#
# Con self.each, llamamos al #eachmétodo en la instancia del objeto que invoca este método. En el ejemplo, esto terminará siendo una matriz. Por lo tanto, selfhará referencia a la matriz que llama a #my_find. Luego, podemos usar el #eachmétodo para iterar a través de sus elementos. Ahora es aquí donde yieldse vuelve extremadamente útil. Cuando se llama dentro del #my_findmétodo, yielddará control al bloque que se ha proporcionado para #my_find. En el ejemplo de uso justo debajo de la definición, podemos ver que el { |n| n == 2 }bloque se pasa al #my_findmétodo. Dentro de #my_find, cada elemento de la matriz se cede a ese bloque como argumento.

# Si el bloque devuelve true/truthy para un elemento, buscamos returnese elemento inmediatamente. Si no se encuentra nada, iteraremos por todo el array y terminaremos ejecutando el nilretorno al final. Muy bueno, ¿no? Ahora es momento de que practiques:

# Bifurca y clona nuestro repositorio de enumerables personalizados
# Siga las instrucciones de instalación en el archivo README para configurar el repositorio localmente.
# Reconstruya cada uno de los métodos en la tabla al final del README y asegúrese de que todos pasen las pruebas asociadas a ellos.