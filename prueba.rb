file = File.open('datos.csv', 'r')
data = file.readlines
file.close

def promedios(readfile)
  file = File.open('promedios.csv', 'w')
  readfile.each do |alumno|
    nombre = alumno.split(', ').map(&:chomp)[0]
    nota1 = alumno.split(', ').map(&:chomp)[1]
    nota2 = alumno.split(', ').map(&:chomp)[2]
    nota3 = alumno.split(', ').map(&:chomp)[3]
    nota4 = alumno.split(', ').map(&:chomp)[4]
    nota5 = alumno.split(', ').map(&:chomp)[5]
    sum = nota1.to_f + nota2.to_f + nota3.to_f + nota4.to_f + nota5.to_f
    avr = sum / 5
    file.puts "El promedio de #{nombre} es #{avr}"
  end
  file.close
end

def inasistencias(readfile)
  totalabsent = 0
  readfile.each do |alumno|
    alumnito = alumno.split(', ').map(&:chomp)
    alumnito.shift
    absent = alumnito.count('A')
    totalabsent += absent
  end
  puts "El total de inasistencias es #{totalabsent}"
end

def aprobados(readfile)
  readfile.each do |alumno|
    nombre = alumno.split(', ').map(&:chomp)[0]
    nota1 = alumno.split(', ').map(&:chomp)[1]
    nota2 = alumno.split(', ').map(&:chomp)[2]
    nota3 = alumno.split(', ').map(&:chomp)[3]
    nota4 = alumno.split(', ').map(&:chomp)[4]
    nota5 = alumno.split(', ').map(&:chomp)[5]
    sum = nota1.to_f + nota2.to_f + nota3.to_f + nota4.to_f + nota5.to_f
    avr = sum / 5
    puts "#{nombre}: aprobado" if avr > 5
    puts "#{nombre}: reprobado" if avr < 5
  end
end
# Menu start
p 'Presiona Enter'

option = gets.chomp.to_i

while option != 4
  p 'Opción 1: Genera un archivo con el nombre de cada alumno su promedio.'
  p 'Opción 2: Muestra la cantidad de inasistencias totales'
  p 'Opción 3: Muestra los alumnos aprobados'
  p 'Opción 4: Salir'

  option = gets.chomp.to_i
puts case option
     when 1
       promedios(data)
     when 2
       inasistencias(data)
     when 3
       aprobados(data)
     when 4
       exit
     else
       p 'Esa no es una opción válida. Recuerda ingresar un número del 1 al 4'
     end
end
