 select * from dw_usuario du where du.usuario =
(select trt.usuario from tab_responsavel_tecnico trt where trt.pessoa =
(select tp.id from tab_pessoa tp where tp.nome = 'REJANE'))
