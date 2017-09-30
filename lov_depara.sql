select ld.de_classificacao_ctpf,lp.texto,ld.para_codigo_ibama,lpi.descricao 
from lov_depara_produto_ctpf_ibama ld,lov_produto lp,lov_produtos_ibama lpi
where lp.classificacao=ld.de_classificacao_ctpf and
      lpi.codigo=ld.para_codigo_ibama
