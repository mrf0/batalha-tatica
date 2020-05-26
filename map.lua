Mapa = {
	dados = {}

}

function Mapa:novo()
	
	o = {} -- Iniciando o objeto
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

--
-- Desenha mapa na tela usando LÖVE
-- Recebe largura e altura da janela como parametro
--
function Mapa:desenha(largura, altura)
	-- 
	-- Centralizando o mapa na janela
	-- (so funciona com mapa quadrado :D )
	--

	-- Tratando os casos, janela na horizontal ou vertical

	deslocamento = { x = nil, y = nil }
	
	if largura < altura then

		deslocamento.x = largura/10
		lado = largura - 2 * deslocamento.x -- Tamanho do quadradão
		deslocamento.y = (altura - lado)/2

	else

		deslocamento.y = altura/10
		lado = altura - 2 * deslocamento.y
		deslocamento.x = (largura - lado )/2

	end

	tam = lado/self.dim -- Tamanho dos quadradinhos

	-- Desenhando o mapa em forma de um tabuleiro de Xadrez
	for i=1, self.dim do

		if color == 1 then color = 0 end

		for j=1, self.dim do

			if (j+i)%2==0 then color = 1 else color = 0.5 end
			love.graphics.setColor(color, color, color)

			love.graphics.rectangle("fill", deslocamento.x + ((i-1) * tam),
			deslocamento.y + ((j-1) * tam), tam, tam)

			if color == 1 then color = 0 end

		end

	end

end

	
