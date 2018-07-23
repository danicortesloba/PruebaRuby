file = File.open('datos.csv', 'r')
data = file.readlines
file.close

def averages(readfile)
  file = File.open('promedios.csv', 'w')
    readfile.each do |student|
    studentinfo = student.split(', ').map(&:chomp)
    name = studentinfo.shift
    sum = studentinfo.inject(0) { |suma, grade| suma + grade.to_f }
    amount = studentinfo.length
    avr = sum / amount
    file.puts "El promedio de #{name} es #{avr}"
    end
  file.close
end

def absences(readfile)
  totalabsent = 0
    readfile.each do |student|
    studentinfo = student.split(', ').map(&:chomp)
    studentinfo.shift
    absent = studentinfo.count('A')
    totalabsent += absent
    end
  puts "El total de inasistencias es #{totalabsent}"
end

def fails(readfile)
  readfile.each do |student|
  studentinfo = student.split(', ').map(&:chomp)
  name = studentinfo.shift
  sum = studentinfo.inject(0) { |suma, grade| suma + grade.to_f }
  amount = studentinfo.length
  avr = sum / amount
  puts "#{name}: aprobado" if avr > 5
  puts "#{name}: reprobado" if avr < 5
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
       averages(data)
     when 2
       absences(data)
     when 3
       fails(data)
     when 4
       exit
     else
       p 'Esa no es una opción válida. Recuerda ingresar un número del 1 al 4'
     end
end
