file = File.open('datos.csv', 'r')
data = file.readlines
file.close


def promedios (readfile)
readfile.each do |alumno|
nombre = alumno.split(', ').map(&:chomp)[0]
nota1 = alumno.split(', ').map(&:chomp)[1]
nota2 = alumno.split(', ').map(&:chomp)[2]
nota3 = alumno.split(', ').map(&:chomp)[3]
nota4 = alumno.split(', ').map(&:chomp)[4]
nota5 = alumno.split(', ').map(&:chomp)[5]
sum = nota1.to_f + nota2.to_f + nota3.to_f + nota4.to_f + nota5.to_f
avr = sum/5
puts "El promedio de #{nombre} es #{avr}"
end
end


promedios(data)
