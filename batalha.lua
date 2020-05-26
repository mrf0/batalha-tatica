-- Batalha irá lidar dentre outras coisas com
--    criação das criaturas da batalha
--    criação do mapa
--    desenhar tudo na tela

require "map"

Batalha = {}

function Batalha:novo(largura, altura)

	local o = {}
	
	setmetatable(o, self)
	self.__index = self

	o['mapa'] = Mapa:novo()
	o.mapa:iniciarQuad(15)
	o.mapa:calculaDeslocamento(largura, altura)

	return o

end

function Batalha:recalculaDeslocamento(largura, altura)

	self.mapa:calculaDeslocamento(largura, altura)

end

function Batalha:desenha()

	self.mapa:desenha()

end

