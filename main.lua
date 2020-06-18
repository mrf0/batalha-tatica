require "batalha"

function love.load()

   batalha = Batalha:novo(love.graphics.getDimensions())

end

function love.draw()

   desenharBatalha(batalha:desenha())

end

function desenharBatalha(margem, lado, dim, separacao)

   for i=1, dim.x do

      for j=1, dim.y do

         local pos_x = lado*(i-1) + margem.horizontal
	 local pos_y = lado*(j-1) + margem.vertical
	 
         love.graphics.rectangle("line", pos_x, pos_y, lado, lado)
	 -- Desenha quadrado com LADO, em LADO * (i-1) + margem

      end

   end

   love.graphics.rectangle("line", separacao, 0,
			   batalha.tela.x - separacao,
			   batalha.tela.y)

end
