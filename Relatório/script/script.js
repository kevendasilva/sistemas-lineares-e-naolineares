// Carregando os dados gerados pelo método de Gauss-Seidel
// Gambiarra louca, mas é que temos (por enquanto)
// O código começa na linha 538
let dataStringGS = `[
  {"variable":[
  {"value":2.5, "err":999},
  {"value":-0.17391304347826086, "err":999},
  {"value":3.0144927536231885, "err":999},
  {"value":3.5, "err":999},
  {"value":-2.8081841432225065, "err":999},
  {"value":0.22708866155157714, "err":999}
  ]}
  ,
  {"variable":[
  {"value":2.8505434782608696, "err":0.14021739130434785},
  {"value":-0.6176099929574855, "err":2.5512574595055417},
  {"value":2.8689227423798758, "err":0.048290051806675845},
  {"value":1.7447250639386187, "err":0.5015071245889661},
  {"value":-3.4421137464215086, "err":0.22574360186776848},
  {"value":0.07183435814093608, "err":0.6836726340710726}
  ]}
  ,
  {"variable":[
  {"value":2.4092856365135846, "err":0.15479779386368053},
  {"value":-1.078358202617697, "err":0.7460180614207258},
  {"value":2.543949602163918, "err":0.1132735766688443},
  {"value":1.1750193812235226, "err":0.32653034824238586},
  {"value":-3.874588319227063, "err":0.12564215033717696},
  {"value":-0.09049790931409485, "err":2.2598137111010534}
  ]}
  ,
  {"variable":[
  {"value":2.107698321344092, "err":0.12517706933492204},
  {"value":-1.4419368961173176, "err":0.33715948245864796},
  {"value":2.2698137646841143, "err":0.10775993252642264},
  {"value":0.7861738942966552, "err":0.33092687077380023},
  {"value":-4.208598065407578, "err":0.08620522199043494},
  {"value":-0.22165869609289235, "err":1.44932394320373}
  ]}
  ,
  {"variable":[
  {"value":1.8773032887284231, "err":0.1093111999390617},
  {"value":-1.7268906748186013, "err":0.19761875812219978},
  {"value":2.0532124268372693, "err":0.09542692057689102},
  {"value":0.4867023859710888, "err":0.38092273286877126},
  {"value":-4.469827840740019, "err":0.06207049741328589},
  {"value":-0.32478961342943624, "err":0.4652689885594381}
  ]}
  ,
  {"variable":[
  {"value":1.6973924608370856, "err":0.09583471619718874},
  {"value":-1.950133764631181, "err":0.12927459338792824},
  {"value":1.8833525247918166, "err":0.08272884959453602},
  {"value":0.252578926452349, "err":0.4810402953986079},
  {"value":-4.674434751811219, "err":0.04577512118169755},
  {"value":-0.40561838476664946, "err":0.2488650129040351}
  ]}
  ,
  {"variable":[
  {"value":1.556505483490953, "err":0.08300200489676544},
  {"value":-2.125023522879369, "err":0.08968090364881401},
  {"value":1.750267649615173, "err":0.07066381541679491},
  {"value":0.069211993289505, "err":0.7259787494481952},
  {"value":-4.8347201417609185, "err":0.0342897908431801},
  {"value":-0.46894311417637896, "err":0.15611898224524498}
  ]}
  ,
  {"variable":[
  {"value":1.4461397377215037, "err":0.07090610790648771},
  {"value":-2.262032402946143, "err":0.06447405338889133},
  {"value":1.6460072809515298, "err":0.059568242997901866},
  {"value":-0.07443351526677766, "err":2.0754424447137607},
  {"value":-4.960287496062216, "err":0.02597200057490055},
  {"value":-0.518552085273783, "err":0.10578888909486184}
  ]}
  ,
  {"variable":[
  {"value":1.3596796091185812, "err":0.059786842410641874},
  {"value":-2.3693652905615594, "err":0.04744975689809858},
  {"value":1.5643294673441188, "err":0.049621781478508646},
  {"value":-0.18696512766861714, "err":1.51184062714913},
  {"value":-5.058657039535966, "err":0.019831419761826573},
  {"value":-0.5574158280769639, "err":0.07494665223969105}
  ]}
  ,
  {"variable":[
  {"value":1.291946713760643, "err":0.04981533510077886},
  {"value":-2.4534499716762572, "err":0.03548827251317125},
  {"value":1.50034298103454, "err":0.04090345905086967},
  {"value":-0.27512245510376293, "err":0.47151748849870334},
  {"value":-5.135719824788736, "err":0.015233842628682954},
  {"value":-0.587861721889253, "err":0.054619715262346984}
  ]}
  ,
  {"variable":[
  {"value":1.238884707273901, "err":0.04107135837846381},
  {"value":-2.5193219862836282, "err":0.026848729490239268},
  {"value":1.4502159090027607, "err":0.03341040859684953},
  {"value":-0.34418498076785714, "err":0.2510246778586181},
  {"value":-5.19609087950444, "err":0.011755130103536626},
  {"value":-0.6117130626563924, "err":0.0405730461416787}
  ]}
  ,
  {"variable":[
  {"value":1.1973158842622038, "err":0.033553423306973605},
  {"value":-2.5709261815623026, "err":0.02048336638176136},
  {"value":1.410946315729213, "err":0.02707844606431832},
  {"value":-0.3982886249155584, "err":0.15719350689562075},
  {"value":-5.243385617838496, "err":0.009101984439996293},
  {"value":-0.6303982244124148, "err":0.030545631435237357}
  ]}
  ,
  {"variable":[
  {"value":1.164750831104404, "err":0.027198380632749024},
  {"value":-2.6113529543871157, "err":0.01572459493965188},
  {"value":1.3801824811571959, "err":0.02180368893491005},
  {"value":-0.4406734681908624, "err":0.10641740844165476},
  {"value":-5.280436358227756, "err":0.007066186447018085},
  {"value":-0.6450361968784052, "err":0.02322019939005104}
  ]}
  ,
  {"variable":[
  {"value":1.1392393392825844, "err":0.021902960822642075},
  {"value":-2.643023324444822, "err":0.012127954593230916},
  {"value":1.3560820655846966, "err":0.01746176023933635},
  {"value":-0.4738777923909758, "err":0.07534904321884914},
  {"value":-5.309461941449844, "err":0.005496815273014663},
  {"value":-0.6565035976256717, "err":0.01777791820484175}
  ]}
  ,
  {"variable":[
  {"value":1.119253613728717, "err":0.017543043735175966},
  {"value":-2.667833920728053, "err":0.009387202925438563},
  {"value":1.337201778428561, "err":0.013922672996928844},
  {"value":-0.4998900897236573, "err":0.05489241688544849},
  {"value":-5.33220060935601, "err":0.00428266897039987},
  {"value":-0.6654871696471116, "err":0.013683964648373872}
  ]}
  ,
  {"variable":[
  {"value":1.1035967784205165, "err":0.01398863949703126},
  {"value":-2.687270564089268, "err":0.007285552226545996},
  {"value":1.3224109445516905, "err":0.01106103365660511},
  {"value":-0.5202681467638346, "err":0.04076507508168934},
  {"value":-5.350014102169962, "err":0.003340739428050725},
  {"value":-0.6725249080189453, "err":0.010575317891651528}
  ]}
  ,
  {"variable":[
  {"value":1.0913311996098867, "err":0.011114185045179737},
  {"value":-2.7024972479157423, "err":0.005666226553422882},
  {"value":1.3108237920383898, "err":0.00876214202630395},
  {"value":-0.5362323349100127, "err":0.03068453881998793},
  {"value":-5.363969208403195, "err":0.0026084241960358306},
  {"value":-0.6780382785660017, "err":0.008198016878359485}
  ]}
  ,
  {"variable":[
  {"value":1.0817223341783773, "err":0.008804719809114084},
  {"value":-2.7144258456701293, "err":0.004413916707440416},
  {"value":1.3017464063761497, "err":0.006924947286869429},
  {"value":-0.5487386942093379, "err":0.023322650435513074},
  {"value":-5.374901651131568, "err":0.0020381255565833233},
  {"value":-0.6823574579931316, "err":0.006370111487311044}
  ]}
  ]
  `;
let dataStringJ = `[
  {"variable":[
  {"value":2.5, "err":999},
  {"value":-1.0434782608695652, "err":999},
  {"value":3.111111111111111, "err":999},
  {"value":2.6666666666666665, "err":999},
  {"value":-3.5294117647058822, "err":999},
  {"value":0.0, "err":999}
  ]}
  ,
  {"variable":[
  {"value":2.3115942028985508, "err":0.07536231884057969},
  {"value":-1.0321113952827508, "err":0.010893246187363833},
  {"value":2.5314009661835746, "err":0.18633540372670818},
  {"value":1.147058823529412, "err":0.5698529411764706},
  {"value":-3.515771526001705, "err":0.003864734299516933},
  {"value":0.11601307189542487, "err":999}
  ]}
  ,
  {"variable":[
  {"value":2.127326655299801, "err":0.07971448767594812},
  {"value":-1.217737252430903, "err":0.1798506033326948},
  {"value":2.5892772567964384, "err":0.02286334381080689},
  {"value":1.0933503836317138, "err":0.046822742474916315},
  {"value":-3.8461670260602108, "err":0.09397524771305225},
  {"value":-0.026356919579425986, "err":1.2271892222902634}
  ]}
  ,
  {"variable":[
  {"value":2.027800171738513, "err":0.0467847677804151},
  {"value":-1.412898727574848, "err":0.16026566876750686},
  {"value":2.4228762288364205, "err":0.06426543450425859},
  {"value":0.8116642010597932, "err":0.2576357833581776},
  {"value":-3.9931201028541445, "err":0.038207669037312694},
  {"value":-0.0738370031871799, "err":1.8014276465303065}
  ]}
  ,
  {"variable":[
  {"value":1.89500866134505, "err":0.06548550110813696},
  {"value":-1.54758341349788, "err":0.0953250811926273},
  {"value":2.29335092770856, "err":0.05345931401129174},
  {"value":0.6805199886767413, "err":0.16157446911150736},
  {"value":-4.182578910651226, "err":0.04744630837967101},
  {"value":-0.142990962076047, "err":0.9365759159206248}
  ]}
  ,
  {"variable":[
  {"value":1.8112732918356527, "err":0.04418732812015922},
  {"value":-1.7043028337916983, "err":0.10126718787945509},
  {"value":2.187791009356268, "err":0.046028681034770334},
  {"value":0.5099502800141996, "err":0.2506461404524082},
  {"value":-4.304866298029411, "err":0.02923731745186478},
  {"value":-0.2108958138199648, "err":0.47488911717234206}
  ]}
  ,
  {"variable":[
  {"value":1.7115923681059257, "err":0.055033618713995563},
  {"value":-1.8095444173403281, "err":0.06175051843016094},
  {"value":2.0705447306401834, "err":0.05359116945570727},
  {"value":0.40051356525894377, "err":0.21460271529257435},
  {"value":-4.44917145054824, "err":0.03352140171807116},
  {"value":-0.26021467854144753, "err":0.2338541663211234}
  ]}
  ,
  {"variable":[
  {"value":1.6452919869872038, "err":0.038736081297260604},
  {"value":-1.9324457351058297, "err":0.06791837580098874},
  {"value":1.9901576887925079, "err":0.03882410298029204},
  {"value":0.27108315566981506, "err":0.32316111317090634},
  {"value":-4.545531408705403, "err":0.021657955695388916},
  {"value":-0.3165834643177492, "err":0.21662415853040792}
  ]}
  ,
  {"variable":[
  {"value":1.567662526905812, "err":0.047182786213858574},
  {"value":-2.014877815095385, "err":0.04265686662867205},
  {"value":1.8968263852444285, "err":0.0468964364349975},
  {"value":0.1847430565254656, "err":0.3185004207694612},
  {"value":-4.658227948313663, "err":0.02479281946934268},
  {"value":-0.3547477169341361, "err":0.12055036638957907}
  ]}
  ,
  {"variable":[
  {"value":1.5156539745179907, "err":0.033175859915764945},
  {"value":-2.111167275724695, "err":0.047789230646103215},
  {"value":1.8340688951985034, "err":0.0330855214447252},
  {"value":0.08373554342616174, "err":0.5467459237656418},
  {"value":-4.7337675926855525, "err":0.016216390698363205},
  {"value":-0.3992111439977048, "err":0.12533816270288772}
  ]}
  ,
  {"variable":[
  {"value":1.4548833050659227, "err":0.04009534529238069},
  {"value":-2.1757434632486556, "err":0.030587906636528193},
  {"value":1.7608132272650785, "err":0.03994161185831371},
  {"value":0.01603959638229509, "err":0.8084493665890059},
  {"value":-4.822021412678554, "err":0.018643462794702477},
  {"value":-0.42906419982891525, "err":0.07478011643728584}
  ]}
  ,
  {"variable":[
  {"value":1.4141332179234591, "err":0.028009179155861638},
  {"value":-2.251177458692729, "err":0.03467044562847539},
  {"value":1.7116695427156734, "err":0.027909652079190595},
  {"value":-0.06305317343039481, "err":4.931094768693462},
  {"value":-4.881204049790831, "err":0.012273408192810671},
  {"value":-0.46392570806095923, "err":0.08125009787799736}
  ]}
  ,
  {"variable":[
  {"value":1.3665296239748361, "err":0.03366273654085084},
  {"value":-2.3017663930844465, "err":0.02247221079634251},
  {"value":1.6542677638102798, "err":0.03353554963320896},
  {"value":-0.1160916272194014, "err":0.8411702520818625},
  {"value":-4.950339082637162, "err":0.014163520340702174},
  {"value":-0.4873083736568625, "err":0.050401745774413614}
  ]}
  ,
  {"variable":[
  {"value":1.3346053500553516, "err":0.02336156740358551},
  {"value":-2.3608615224139795, "err":0.025673817076781395},
  {"value":1.6157705044389243, "err":0.02327148011557975},
  {"value":-0.1780495137664957, "err":0.5336981488768364},
  {"value":-4.996703268276039, "err":0.009365860573368632},
  {"value":-0.5146216370418979, "err":0.05604923876039931}
  ]}
  ,
  {"variable":[
  {"value":1.2973130495721983, "err":0.02794256780223958},
  {"value":-2.400492928700998, "err":0.0167868406980921},
  {"value":1.570800648862501, "err":0.027831833452139333},
  {"value":-0.21960039549890867, "err":0.23336700479230274},
  {"value":-5.050863422960675, "err":0.010839177709130308},
  {"value":-0.5329392366920261, "err":0.03559430527526949}
  ]}
  ,
  {"variable":[
  {"value":1.2723034862121374, "err":0.01927797100962488},
  {"value":-2.4467881125528983, "err":0.019285698907245807},
  {"value":1.5406420455252114, "err":0.019199510363793786},
  {"value":-0.2681379321163841, "err":0.2210266357089354},
  {"value":-5.0871852105342175, "err":0.007191203667956559},
  {"value":-0.5543367295895014, "err":0.04014996724634185}
  ]}
  ,
  {"variable":[
  {"value":1.243088702209003, "err":0.022962118959613826},
  {"value":-2.4778353907834356, "err":0.012688993407828687},
  {"value":1.5054125020975002, "err":0.022866793445002552},
  {"value":-0.3006889782854323, "err":0.12139664803157933},
  {"value":-5.129614296633119, "err":0.008340385565487605},
  {"value":-0.5686867155938629, "err":0.02588676744365815}
  ]}
  ,
  {"variable":[
  {"value":1.2234961823226032, "err":0.01576115996516042},
  {"value":-2.514103079920507, "err":0.014636843622450817},
  {"value":1.4817862426341522, "err":0.015694209680356352},
  {"value":-0.33871329701907865, "err":0.12645730798137658},
  {"value":-5.158068821632805, "err":0.005547108097067246},
  {"value":-0.5854495550943348, "err":0.0294764042148708}
  ]}
  ,
  {"variable":[
  {"value":1.2006092979123617, "err":0.0187061347153487},
  {"value":-2.538425545416368, "err":0.009674410603971634},
  {"value":1.4541873755577919, "err":0.018625403774365005},
  {"value":-0.36421382031433563, "err":0.07528645470868721},
  {"value":-5.191307803092023, "err":0.00644407482890016},
  {"value":-0.5966913433976129, "err":0.019201975995125027}
  ]}
  ,
  {"variable":[
  {"value":1.1852604997525242, "err":0.012784173991094525},
  {"value":-2.566837685644886, "err":0.011192820006015848},
  {"value":1.4356785443697455, "err":0.012727954800836315},
  {"value":-0.3940021027572283, "err":0.08178789705778824},
  {"value":-5.2135991038596385, "err":0.004293966301581708},
  {"value":-0.6098233691903063, "err":0.02200807157335072}
  ]}
  ,
  {"variable":[
  {"value":1.1673308943329035, "err":0.0151271432932797},
  {"value":-2.585891926901194, "err":0.007423235743681725},
  {"value":1.414057566112705, "err":0.015059762745519012},
  {"value":-0.41397923598891734, "err":0.05070311323693193},
  {"value":-5.239638551473453, "err":0.00499452433819419},
  {"value":-0.6186301958812458, "err":0.014441602496527374}
  ]}
  ,
  {"variable":[
  {"value":1.1553066320507883, "err":0.010300645978351064},
  {"value":-2.6081500230220773, "err":0.008607512127375002},
  {"value":1.399557731329894, "err":0.010254062585776973},
  {"value":-0.4373154028713344, "err":0.05637038009085511},
  {"value":-5.25710157650655, "err":0.0033328682621029055},
  {"value":-0.6289178368730961, "err":0.01662971038326936}
  ]}
  ,
  {"variable":[
  {"value":1.1412605631300445, "err":0.012157870933200272},
  {"value":-2.6230771326960745, "err":0.005723255772189442},
  {"value":1.382619837488581, "err":0.01210231879839508},
  {"value":-0.45296550698743704, "err":0.03578676628663626},
  {"value":-5.277500903077964, "err":0.003880337154331798},
  {"value":-0.6358171127625045, "err":0.010970075079617376}
  ]}
  ,
  {"variable":[
  {"value":1.131840745278533, "err":0.008253871338265193},
  {"value":-2.640514145143321, "err":0.0066475408709480936},
  {"value":1.3712606539410677, "err":0.008215695478625825},
  {"value":-0.47124708100862794, "err":0.040359748676620406},
  {"value":-5.29118145254106, "err":0.0025922400989295065},
  {"value":-0.6438764599549731, "err":0.012675574517729256}
  ]}
  ,
  {"variable":[
  {"value":1.120837042302261, "err":0.009721953395098947},
  {"value":-2.65220805623813, "err":0.004428649290259488},
  {"value":1.3579914927181669, "err":0.009676614861488651},
  {"value":-0.4835073866011956, "err":0.026016724743050796},
  {"value":-5.307162303254862, "err":0.003020280226097271},
  {"value":-0.6492813588661817, "err":0.008394310473140319}
  ]}
  ]
  `;
let iterationsGS = JSON.parse(dataStringGS); // Objeto com os dados do método de Gauss-Seidel  
let iterationsJ = JSON.parse(dataStringJ); // Objeto com os dados do método de Jacobi
// Definindo um array com os números de iterações (para o gráfico)
let rangeGS = getRange(iterationsGS);
let rangeJ = getRange(iterationsJ);
// Cores para os gráficos
let colors = ['#FF0000', '#000000', '#008000', '#0000FF', '#FFFF00', '#78866B']
// Capturando o ambiente que o gráfico será plotado
let errChartGS = document.getElementById('errChartGaussSeidel').getContext('2d');
let errChartJ = document.getElementById('errChartJacobi').getContext('2d');
// Configurações do gráfico
let configGS = {
  type: 'line', // Tipo de gráfico
  data: { // Dados do gráfico
    labels: rangeGS, // Intervalo
    datasets: [] // Dados das curvas
  },
  options: { // Opções do gráfico
    tooltips: {
      mode: 'index',
      intersect: false
    },
    title: { // Titulo
      display: true, 
      text: 'Erro Relativo Estimado'
    },
    scales: { // Escalas
      xAxes: [{ // Eixo-x
        display: true,
        scaleLabel: { // Legenda do eixo
          display: true,
          labelString: 'Iterações' // Legenda
        }
      }],
      yAxes: [{ // Eixo-y
        ticks: { // Definindo as medidas do eixo-y
          max: 2.5, // Valor máximo
          min: 0, // Mínimo
          stepSize: 0.2 // Passo
        },
        display: true,
        scaleLabel: { // Legenda do eixo
          display: true,
          labelString: 'Erro Relativo Estimado - ERE' // Legenda
        }
      }]
    }
  },
};
// Configurações do gráfico para o método de Jacobi
let configJ = {
  type: 'line', // Tipo de gráfico
  data: { // Dados do gráfico
    labels: rangeJ, // Intervalo
    datasets: [] // Dados das curvas
  },
  options: { // Opções do gráfico
    title: { // Titulo
      display: true, 
      text: 'Erro Relativo Estimado'
    },
    tooltips: {
      mode: 'index',
      intersect: false
    },
    scales: { // Escalas
      xAxes: [{ // Eixo-x
        display: true,
        scaleLabel: { // Legenda do eixo
          display: true,
          labelString: 'Iterações' // Legenda
        }
      }],
      yAxes: [{ // Eixo-y
        ticks: { // Definindo as medidas do eixo-y
          max: 5,
          min: 0,
          stepSize: 0.2
        },
        display: true,
        scaleLabel: { // Legenda do eixo
          display: true,
          labelString: 'Erro Relativo Estimado - ERE' // Legenda
        }
      }]
    }
  },
};

// Capturando os dados relativos aos erros de cada incógnita
function getDataErr(ind, iterations){
  let arrayData = [];
  // Exibindo os valores a partir da segunda iteração
  for (let i = 0 ; i < iterations.length ; i++){
    arrayData.push(iterations[i].variable[ind].err);
  }
  return arrayData
}

// Definindo as linhas do gráfico
function datasets(config, iterations){
  for (let i = 0 ; i < iterations[0].variable.length ; i++){   
    let newDataset = {
      backgroundColor: colors[i],
			borderColor: colors[i],
      label: ("ERE - x_" + (i + 1)),
      data: getDataErr(i, iterations),
      fill: false
    }
    config.data.datasets.push(newDataset);
  }
}

// Definindo o intervalo
function getRange(iterations){
  let range = [];
  // Definindo a escala do eixo x
  for (let i = 1 ; i < getDataErr(0, iterations).length + 1 ; i++){
    range.push(i);
  }
  return range;
}

// Criando os dados das curvas
datasets(configGS, iterationsGS);
datasets(configJ, iterationsJ);

// Plotando o gráfico
let myChartGS = new Chart(errChartGS, configGS);
let myChartJ = new Chart(errChartJ, configJ);