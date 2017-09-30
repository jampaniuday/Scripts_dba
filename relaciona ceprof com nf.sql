select sum(z.q) x from 
(
select count(*) q from tab_gf1 g, tab_dvpf d where to_number(g.nota_fiscal) = to_number(126) and g.status in ('3','5','6') and g.id_dvpf = d.id and d.id_empreendimento_remeten = 240
union
select count(*) q from tab_gf2 gf2, tab_dvpf2 d2 where to_number(gf2.nota_fiscal) = to_number(126) and gf2.status in ('3','5','6') and gf2.id_dvpf2 = d2.id and d2.id_empreendimento_remeten = 240
union
select count(*) q from tab_gf3 gf3 where to_number(gf3.nota_fiscal) = to_number(126) and gf3.status in ('3','5','6') and gf3.id_empreendimento_remeten = 240
) z