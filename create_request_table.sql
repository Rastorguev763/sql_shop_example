SELECT S.shop_name,
  p.product_name,
  COALESCE(SUM(SD.sales_cnt), 0) + COALESCE(SUM(SM.sales_cnt), 0) + COALESCE(SUM(SS.sales_cnt), 0) AS sales_fact,
  PL.plan_cnt AS sales_plan,
  (COALESCE(SUM(SD.sales_cnt), 0) + COALESCE(SUM(SM.sales_cnt), 0) + COALESCE(SUM(SS.sales_cnt), 0))::DECIMAL / PL.plan_cnt AS sales_fact_div_sales_plan,
  (COALESCE(SUM(SD.sales_cnt), 0) + COALESCE(SUM(SM.sales_cnt), 0) + COALESCE(SUM(SS.sales_cnt), 0)) * p.price AS income_fact,
  PL.plan_cnt * p.price AS income_plan,
  ((COALESCE(SUM(SD.sales_cnt), 0) + COALESCE(SUM(SM.sales_cnt), 0) + COALESCE(SUM(SS.sales_cnt), 0)) * p.price) / (PL.plan_cnt * p.price) AS income_fact_div_income_plan
FROM
  public.shops AS S
  JOIN public.plan AS PL ON S.shop_id = PL.shop_id
  JOIN public.products p ON PL.product_id = p.product_id
  LEFT JOIN public.shop_dns as SD ON S.shop_id = SD.shop_id AND PL.product_id = SD.product_id
  LEFT JOIN public.shop_mvideo AS SM ON S.shop_id = SM.shop_id AND PL.product_id = SM.product_id
  LEFT JOIN public.shop_sitilink AS SS ON S.shop_id = SS.shop_id AND PL.product_id = SS.product_id
GROUP BY S.shop_name, p.product_name, PL.plan_cnt, SD.sales_cnt, SM.sales_cnt, SS.sales_cnt, p.price
ORDER by S.shop_name
