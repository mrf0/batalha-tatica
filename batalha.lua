-- Batalha irá transformar de todas as coordenadas especificas das
-- coisas para coordenadas de tela.
--
-- Irá gerenciar todos os processos da batalha.

require "criaturas"
require "map"

Batalha = {tela = {x = nil, y = nil}}

function Batalha:novo(largura, altura)

	local o = {}
	
	setmetatable(o, self)
	self.__index = self

	o.tela.x, o.tela.y = largura, altura
	
	o.mapa = Mapa:novo()
	o.mapa:iniciarRet(15, 3)

	o.aliado = criatura:novo(1)
	o.inimigo = criatura:novo(2)
	
	return o

end

-- Deve transformar das coordenadas locais do mapa e das informações
-- para a coordenada da tela.
function Batalha:desenha()

   -- Essa função deve ter acesso á quantidade de celulas no mapa
   --      (vertical e horizontal)<_________________|
   local dim = self.mapa:getDim()

   -- Deve separa o espaço do mapa, do espaço das informações.
   local separacao = self.tela.x - self.tela.x/5
   --             |_________________________|
   --                          |__> (separa a parte de informações
   --                               como 1/5 da tela à direita)

   -- O mapa deve ficar centralizado.
   --
   -- Definindo a área do mapa
   local min_x, max_x = 0, separacao
   local min_y, max_y = 0, self.tela.y

   local lado
   -- Vendo qual lado do mapa é maior para poder centralizar
   if dim.x > dim.y then lado = max_x/(dim.x+2)
   else lado = max_y/(dim.y+2) end

   -- Calculando a margem
   local margem = {horizontal = (max_x - lado * dim.x)/2,
                   vertical = (max_y - lado * dim.y)/2}
   
   return margem, lado, dim, separacao

end

