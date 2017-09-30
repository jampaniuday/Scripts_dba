create or replace function desc_erro_geom(p_resposta varchar2)
   return varchar2 is

   v_aux      varchar2(5);

begin
   v_aux      := substr(p_resposta,0,5);
   case (v_aux)
      when '13011' then
         return('Valor está acima do limite ');
      when '13013' then
         return('A area não especifica se é borda ou buraco ');
      when '13018' then
         return('A distancia especificada é invalida ');
      when '13019' then
         return('As coordenadas dos vertices estão fora do limite especificado ');
      when '13020' then
         return('Coordenada nula ');
      when '13021' then
         return('As coordenadas do elemento geometrico não estão conectadas ');
      when '13022' then
         return('O poligono possui segmentos que se cruzam ');
      when '13023' then
         return('Um elemento interior (buraco) cruza com a borda do poligono');
      when '13024' then
         return('O poligono tem menos de três segmentos');
      when '13025' then
         return('O poligono não esta fechado ');
      when '13026' then
         return('SDO_ETYPE invalido');
      when '13028' then
         return('SDO_GTYPE invalido');
      when '13029' then
         return('SDO_SRID invalido');
      when '13030' then
         return('Conflito do SDO_GTYPE com o SDO_GEOM_METADATA para o objeto geometrico');
      when '13031' then
         return('SDO_ELEM_INFO e SDO_ORDINATES são nulos e o SDO_GTYPE não é ponto ');
      when '13032' then
         return('Geometria invalida devido ao(s) campo(s) SDO_POINT, SDO_ELEM_INFO ou SDO_ORDINATES ');
      when '13033' then
         return('Dado(s) invalido(s) no SDO_ELEM_INFO da geometria ');
      when '13034' then
         return('Dado(s) invalido(s) no SDO_ORDINATES da geometria ');
      when '13035' then
         return('A geometria possui arcos em coordenadas geograficas ');
      when '13221' then
         return('SDO_GTYPE invalido ');
      when '13331' then
         return('Segmento LRS invalido ');
      when '13332' then
         return('Ponto LRS invalido ');
      when '13333' then
         return('Medida LRS alem do limite ');
      when '13334' then
         return('Segmentos LRS não conectados ');
      when '13335' then
         return('Medida LRS nula ');
      when '13340' then
         return('A geometria de ponto tem mais que uma coordenada ');
      when '13341' then
         return('A geometria de linha tem menos que duas coordenadas ');
      when '13342' then
         return('A geometria de arco tem menos de três coordenadas ');
      when '13343' then
         return('A geometria de polígono tem menos que quatro coordenadas ');
      when '13344' then
         return('O polígono de arcos tem menos que cinco coordenadas ');
      when '13345' then
         return('O polígono composto tem menos que cinco coordenadas ');
      when '13346' then
         return('As coordenadas usadas no arco são colineares ');
      when '13347' then
         return('As coordenadas que definem o arco não são distintas ');
      when '13348' then
         return('O ultimo ponto do polígono deve ser igual ao primeiro ');
      when '13349' then
         return('Borda do polígono se cruza ');
      when '13350' then
         return('Duas ou mais bordas ou buracos da geometria de poligono complexo se tocam ');
      when '13351' then
         return('Duas ou mais bordas ou buracos da geometria de poligono complexo se sobrepõem ');
      when '13352' then
         return('As coordenadas que definem o circulo estão incorretas ');
      when '13353' then
         return('O numero de dados no SDO_ELEM_INFO não é multiplo de três ');
      when '13354' then
         return('O SDO_ELEM_INFO referencia uma posicao incorreta no SDO_ORDINATES da geometria ');
      when '13355' then
         return('O numero de dados no SDO_ORDINATES não é multiplo das dimensoes da geometria ');
      when '13356' then
         return('Pontos repetidos na geometria ');
      when '13356' then
         return('O retangulo deve ter 2 pontos: superior direito e inferior esquerdo');
      when '13358' then
         return('Um circulo deve ter 3 pontos ');
      when '13359' then
         return('Os pontos do retangulo são coincidentes');
      when '13360' then
         return('Subtipo invalido para tipo composto');
      when '13361' then
         return('O tipo composto declara mais subtipos do que estão especificados no SDO_ELEM_INFO ');
      when '13362' then
         return('Os subtipos do tipo composto são desconexos ');
      when '13363' then
         return('Nenhum SDO_ETYPE é valido na geometria ');
      when '13366' then
         return('Combinação invalida de borda e buracos no poligono ');
      when '13367' then
         return('Orientação dos pontos da borda ou dos buracos está errada ');
      when '13368' then
         return('Polígono simples não pode ter mais de um anel exterior ');
      when '13369' then
         return('Valor do SDO_ETYPE de quatro digitos usado errado ');
      when '13371' then
         return('Valores de medida da geometria LRS posicionados errados no SDO_ORDINATES ');
      when '13373' then
         return('Retangulo formado por 2 pontos com dados geograficos não é suportado ');

      else
         return(p_resposta);
   end case;
end desc_erro_geom;
/
