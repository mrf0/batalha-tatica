Mapa = {
	dados = {},
	dim = nil,
	deslocamento = {x = nil, y = nil},
	tam = nil,
}

function Mapa:novo()
	
	local o = {} -- Iniciando o objeto
	setmetatable(o, self) -- O objeto é uma instancia de Mapa
	self.__index = self

	return o

end

--
-- Inicia o mapa como uma matriz quadrada
--
function Mapa:iniciarQuad( dim ) 

	self.dados = {}
	self.dim = dim

	for i=1, dim do

		self.dados[i] = {}
		for j=1, dim do
			
			-- 0 significa não ocupado
			self.dados[i][j] = 0

		end

	end

end

function Mapa:calculaDeslocamento(largura, altura)-- 

	-- Centralizando o mapa na janela
	-- (so funciona com mapa quadrado :D )
	--

	-- Tratando os casos, janela na horizontal ou vertical

	local lado
	
	if largura < altura then

		self.deslocamento.x = largura/10
		lado = largura - 2 * self.deslocamento.x -- Tamanho do quadradão
		self.deslocamento.y = (altura - lado)/2

	else

		self.deslocamento.y = altura/10
		lado = altura - 2 * self.deslocamento.y
		self.deslocamento.x = (largura - lado )/2

	end

	self.tam = lado/self.dim -- Tamanho dos quadradinhos

end

--
-- Desenha mapa na tela usando LÖVE
-- Recebe largura e altura da janela como parametro
--
function Mapa:desenha()
	-- Desenhando o mapa em forma de um tabuleiro de Xadrez
	for i=1, self.dim do

		for j=1, self.dim do

			local color
			if (j+i)%2==0 then color = 1 else color = 0.5 end
			love.graphics.setColor(color, color, color)

			love.graphics.rectangle("fill", self.deslocamento.x + ((i-1) * self.tam), self.deslocamento.y + ((j-1) * self.tam), self.tam, self.tam)

		end

	end

end

	
