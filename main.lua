require "map"

function love.load()

	mapa = Mapa:novo()
	mapa:iniciarQuad(21)

end

function love.draw()

	mapa:desenha(love.graphics.getDimensions())

end

function love.resize(largura, altura)

	mapa:desenha(love.graphics.getDimensions())

end
