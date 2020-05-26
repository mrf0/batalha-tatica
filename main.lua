require "batalha"

function love.load()

	batalha = Batalha:novo(love.graphics.getDimensions())

end

function love.draw()

	batalha:desenha()

end


function love.resize(largura, altura)

	batalha:recalculaDeslocamento(largura, altura)

end
