-- Mapa irá guardar os dados de um mapa em suas coordenadas locais.
-- Em coordenadas locais (do mapa) cada célula tem 1 de lado.

Mapa = {
    dados = {},
    quantidade_celulas = {x = nil, y = nil}	
}

function Mapa:novo()
	
	local o = {} -- Iniciando o objeto
	setmetatable(o, self) -- O objeto é uma instancia de Mapa
	self.__index = self

	return o

end

-- Inicia o mapa como uma matriz quadrada
function Mapa:iniciarQuad( dim ) 

   self:iniciarRet( dim, dim )

end

-- Inicia o mapa como uma malha retangular com tam_x celulas de
-- largura e tam_y celulas de altura.
function Mapa:iniciarRet( tam_x, tam_y )

    self.dados = {}

    self.quantidade_celulas.x = tam_x
    self.quantidade_celulas.y = tam_y

    for i=1, tam_x do

	self.dados[i] = {}
	for j=1, tam_y do
			
            -- 0 significa não ocupado
	    self.dados[i][j] = 0

	end
    end
end

-- Retorna as dimensões da forma que foi definida no inicio deste
-- arquivo 
function Mapa:getDim()

    return self.quantidade_celulas

end

-- Posiciona uma criatura no mapa
function Mapa:mudaCelula (x, y, valor)

   self.dados[x][y] = valor

end
