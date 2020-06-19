-- Este arquivo guarda uma lista com as criaturas possíveis de se usar
--
-- Também possui uma classe criatura que gerencia a criação de uma
-- instancia de uma criatura, seu inicio de turno, seu uso de
-- habilidades e sua movimentação.

require "habilidades"

criaturas = {

   {

      nome = "heroi",

      vida = 10,

      movimento = 3, -- Movimento por turno

      habilidades = {1},

      pontos_habilidade = 6

   },

   {

      nome = "vilao",

      vida = 7,

      movimento = 4,

      habilidades = {1}, -- Vetor de IDs de habilidade

      pontos_habilidade = 6

   }

}

criatura = {}

function criatura:novo (ID)

   local o = {}
   setmetatable(o, self)
   self.__index = self

   local criatura_atual = criaturas[ID]
   
   o.vida_max = criatura_atual.vida
      
   o.pontos_habilidade_maximo = criatura_atual.pontos_habilidade
   
   o.pontos_movimento_maximo = criatura_atual.movimento
   
   o.habilidades = {}
   -- Olha as habilidades na criatura escolhida, cata elas do arquivo
   -- habilidades.lua e carrega na criatura que esta sendo criada.
   --
   -- Carrega a tabela inteira, não os IDs. (Valor, não referencia)
   for _, h in ipairs(criatura_atual.habilidades) do
      o.habilidades[h] = habilidades[h]
   end

   return o
   
end

function criatura:InicioTurno ()

   self.pontos_habilidade_atual = self.pontos_habilidade_maximo

   self.pontos_movimento_atual = self.pontos_movimento_maximo

   self.vida_atual = self.vida_max

end

function criatura:UsaHabilidade (ID)

   local habilidade = self.habilidades[ID]

   -- Se o personagem tiver essa habilidade.
   if habilidade then

      -- Se o personagem tiver pontos de habilidade suficiente.
      if self.pontos_habilidade_atual > habilidade.custo then

	 -- Diminui os pontos de habilidade
	 self.pontos_habilidade_atual = self.pontos_habilidade_atual
	                                         - habilidade.custo;

	 return habilidade

      end

   end

end

-- O movimento será feito um passo de cada vez para que possa ter a
-- interface da forma que desejo
--
function criatura:Move ()

   local pm_atual = self.pontos_movimento_atual

   -- Irá retornar verdadeiro sinalizando que pode mover a criatura no
   -- mapa se tiver ponto de movimento. nesse caso diminui o ponto de
   -- movimento em 1.
   --
   -- Caso contrario retorna falso, e nada acontece.
   --
   if pm_atual > 0 then

      self.pontos_movimento_atual = pm_atual - 1
      return true

   else

      return false

   end

end

function criatura:Volta ()

   local pm_atual = self.pontos_movimento_atual
   local pm_max = self.pontos_movimento_maximo

   if pm_atual < pm_max then

      self.pontos_movimento_atual = pm_atual + 1
      return true

   else

      return false

   end

end

function setPosicao (x, y)

   self.posicao = {x = x, y = y}

end

function getPosicao ()

   return self.posicao

end
