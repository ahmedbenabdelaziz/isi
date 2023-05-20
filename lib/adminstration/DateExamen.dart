import 'package:flutter/material.dart';

class DateExamen extends StatefulWidget {
  const DateExamen({Key? key}) : super(key: key);

  @override
  State<DateExamen> createState() => _DateExamen();
}

class _DateExamen extends State<DateExamen> {
  String _textValue = "";
  bool _showTextField = true;
  bool isheader=false;

  late String _selectedOption;
  late String _selectedOptionn;
  late String _selectedOptionnn;
  late String _selectedOptionnnn;
  late String _selectedOptionnnnn;
  final controllersList = <List<TextEditingController>>[];

  List<String> classe = [
    'Ingénierie',
    'Mastére',
    'L3',
    'L2',
    'L1',
  ];

  List<String> semestre = [
    'semestre 1',
    'semestre 2',

  ];
  List<String> typeclasse = [
    'Génie Logiciel',
    'Systéme Embarqué',
    'Maths',
    'Tic',
  ];

  List<String> TD = [
    'TD 1',
    'TD 2',
    'TD 3',
    'TD 4',
    'TD 5',
    'TD 6',
  ];

  List<String> Matieres = [
    'Physique',
    'Chimie',
    'Maths',
    'Algébre',
    'Analyse',
    'Java',
    'Multimédia'
  ];

  List<List<String>> rows = [
    ['Date', 'Seance N', 'Epreuve', 'Dureé', 'DE', 'A'],
   ];
  final List<List<String>> rowValues = [];

  bool isEditable = true;


  @override
  void initState() {
    _selectedOption = classe[0];
    _selectedOptionn = typeclasse[0];
    _selectedOptionnn = TD[0];
    _selectedOptionnnn = Matieres[0];
    _selectedOptionnnnn = semestre[0];

    for (final row in rows) {
      final controllers =
      row.map((cell) => TextEditingController(text: cell)).toList();
      controllersList.add(controllers);
    }
    super.initState();
  }


  @override
  void dispose() {
    // dispose all controllers to avoid memory leaks
    for (final controllers in controllersList) {
      for (final controller in controllers) {
        controller.dispose();
      }
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFff7f7fa),
      body:Container(
        child:Column(children: [
          Container(
            height: 50,
            padding:EdgeInsets.only(right:30),
            width: double.infinity,
            color: Colors.white,
            child:Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child:Image.asset('lib/adminstration/img/téléchargement (2).png'),
                ),
                Row(
                  children: [
                    Text('ISIMM',style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color(0xFF26519e)),),
                    Text('_eCAMPUS',style:TextStyle(fontSize: 20),),
                  ],
                ),
                SizedBox(width: 40,),
                Container(
                  width: 40,
                  height: 40,
                  decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue
                  ),
                  child:Center(
                    child:Icon(Icons.dashboard,color: Colors.white,),
                  ),
                ),
                SizedBox(width: 20,),
                Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius:BorderRadius.circular(10)
                    )
                    ,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration:InputDecoration(
                        border: InputBorder.none,
                        hintText: "search..."
                    ),
                  ),
                )),
                Expanded(child:Container()),
                Container(
                  padding: EdgeInsets.all(8),
                  child:Stack(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration:BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.1),
                        ),

                      ),
                      Positioned(
                          top: 5,
                          left: 5,
                          right: 5,
                          bottom: 5
                          ,child:CircleAvatar(
                        backgroundImage:AssetImage('lib/adminstration/img/tunisie.png'),
                      ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child:Stack(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration:BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                      ),
                      Positioned(
                          child:CircleAvatar(
                            backgroundColor:Colors.black.withOpacity(0.05),
                            child: Icon(Icons.notifications_none,color: Colors.black,),
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child:Stack(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration:BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.03),
                        ),
                      ),
                      Positioned(
                          child:CircleAvatar(
                            backgroundColor:Colors.black.withOpacity(0.03),

                            child:Icon(Icons.email_outlined,color: Colors.black,),
                          ))
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                          radius:20,
                          child:Image.asset('lib/ISIM_LOGO_ar.png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ISIMM',style:TextStyle(fontWeight: FontWeight.bold),),
                          Text('Adminstration',style:TextStyle(color: Colors.blue),)

                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10,right: 10,top: 20),
                height: 530,
                width: 215,
                color:Colors.white,
                child:ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Text('Menu principal',style:TextStyle(color:Colors.black38,fontSize: 20
                    ),),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal:10,vertical:3),
                            decoration: BoxDecoration(
                                color: Color(0xFF3d5ee1),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(),
                              child: Row(
                                children: [
                                  Icon(Icons.home,color: Colors.white,),
                                  SizedBox(width: 20,),
                                  Text('Acceuille',style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
                                  Expanded(child: Container()),
                                  SizedBox(width:10,),
                                  Icon(Icons.arrow_forward_ios,color: Colors.white,size: 15,)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                    height: 25,
                                    width: 25
                                    ,child: Image.asset('lib/adminstration/img/prof.png')),
                                SizedBox(width: 20,),
                                Text('enseignants',style:TextStyle(color:Colors.black54,)),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                    height: 25,
                                    width: 25
                                    ,child: Image.asset('lib/adminstration/img/etudiant-diplome.png')),
                                SizedBox(width: 20,),
                                Text('Etudiants',style:TextStyle(color:Colors.black54,)),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text('Extra',style:TextStyle(color:Colors.black38,fontSize: 20
                    ),),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                    height: 25,
                                    width: 25
                                    ,child: Image.asset('lib/adminstration/img/discuter.png')),
                                SizedBox(width: 10,),
                                Text('Boite De Recéption',style:TextStyle(color:Colors.black54,)),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                    height: 25,
                                    width: 25
                                    ,child: Image.asset('lib/adminstration/img/calendrier.png',color: Colors.black54,)),
                                SizedBox(width: 10,),
                                Text('Calendrier',style:TextStyle(color:Colors.black54,)),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                    height: 25,
                                    width: 25
                                    ,child: Image.asset('lib/adminstration/img/presse-papiers.png')),
                                SizedBox(width: 10,),
                                Text('Résultats',style:TextStyle(color:Colors.black54,)),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                    height: 25,
                                    width: 25
                                    ,child: Image.asset('lib/adminstration/img/emploi-du-temps.png')),
                                SizedBox(width: 10,),
                                Text('Emploi Du temps',style:TextStyle(color:Colors.black54,)),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                    height: 25,
                                    width: 25
                                    ,child: Image.asset('lib/adminstration/img/discuter.png')),
                                SizedBox(width: 10,),
                                Text('Horaires Examens',style:TextStyle(color:Colors.black54,)),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    Text('Autre',style:TextStyle(color:Colors.black38,fontSize: 20
                    ),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                              height: 25,
                              width: 25
                              ,child: Image.asset('lib/adminstration/img/files-and-folder.png')),
                          SizedBox(width: 10,),
                          Text('Rapports PFE',style:TextStyle(color:Colors.black54,)),
                          Expanded(child: Container()),
                          Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                              height: 25,
                              width: 25
                              ,child: Image.asset('lib/adminstration/img/files-and-folder.png')),
                          SizedBox(width: 10,),
                          Text('PFE BOOK',style:TextStyle(color:Colors.black54,)),
                          Expanded(child: Container()),
                          Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                              height: 25,
                              width: 25
                              ,child: Image.asset('lib/adminstration/img/files-and-folder.png')),
                          SizedBox(width: 10,),
                          Text('Société',style:TextStyle(color:Colors.black54,)),
                          Expanded(child: Container()),
                          Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                        ],
                      ),
                    ),
                    Text('Gestion',style:TextStyle(color:Colors.black38,fontSize: 20
                    ),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                              height: 25,
                              width: 25
                              ,child: Image.asset('lib/adminstration/img/files-and-folder.png')),
                          SizedBox(width: 10,),
                          Text('Rapports PFE',style:TextStyle(color:Colors.black54,)),
                          Expanded(child: Container()),
                          Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                              height: 25,
                              width: 25
                              ,child: Image.asset('lib/adminstration/img/files-and-folder.png')),
                          SizedBox(width: 10,),
                          Text('PFE BOOK',style:TextStyle(color:Colors.black54,)),
                          Expanded(child: Container()),
                          Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                              height: 25,
                              width: 25
                              ,child: Image.asset('lib/adminstration/img/files-and-folder.png')),
                          SizedBox(width: 10,),
                          Text('Société',style:TextStyle(color:Colors.black54,)),
                          Expanded(child: Container()),
                          Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20,right: 30,left: 30),
                width: 1050,
                height: 530,
                color: Color(0xFff7f7fa),
                child:ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Row(
                      children: [
                        Text('Emploi Du temps',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w800),)
                        ,Expanded(child: Container()),
                        Text('Home   /'),
                        Text('  Emploi Du temps',style:TextStyle(color: Colors.black38),)
                      ],
                    ),
                    SizedBox(height: 40,),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        SizedBox(
                          height: 30,
                          width: 85,
                          child: ElevatedButton(
                              style:ElevatedButton.styleFrom(
                                backgroundColor:Color(0xFF3d5ee1),
                              )
                              ,onPressed:(){
                            setState(() {
                              rows.add(['Nouvelle Date', 'Seance N', 'nouvelle epreuve ', 'Durée', 'Debut', 'Fin']);
                            });
                          }, child:Text('Ajouter',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                        ),
                        SizedBox(width: 10,),
                        SizedBox(
                          height: 30,
                          width: 100,
                          child: ElevatedButton(
                              style:ElevatedButton.styleFrom(
                                backgroundColor:Color(0xFF3d5ee1),
                              )
                              ,    onPressed:(){
                            setState(() {
                              if(rows.length==1){
                                print("imp");
                              }else{
                                rows.removeAt(rows.length-1);
                                print(rows.length-1);
                              }
                            });
                          }
                              , child:Text('Supprimer',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                        ),
                        SizedBox(width: 10,),
                        SizedBox(
                          height: 30,
                          width: 85,
                          child: ElevatedButton(
                              style:ElevatedButton.styleFrom(
                                backgroundColor:Color(0xFF3d5ee1),

                              )
                              ,onPressed:(){
                            //getTableValues();
                            getRowValues();
                          }, child:Text('Envoyer',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                        ),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.symmetric(vertical:15,horizontal: 20),
                      height: 700,
                      width: 500,
                      color:Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'classe',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF26519e),
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(width: 10),
                              DropdownButton<String>(
                                value: _selectedOption,
                                items: classe.map((String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedOption = value!;
                                  });
                                },
                              ),
                              SizedBox(width: 15),
                              Text(
                                'Section',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF26519e),
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(width: 10),
                              DropdownButton<String>(
                                value: _selectedOptionn,
                                items: typeclasse.map((String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedOptionn = value!;
                                  });
                                },
                              ),
                              SizedBox(width: 15),
                              Text(
                                'TD',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF26519e),
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(width: 10),
                              DropdownButton<String>(
                                value: _selectedOptionnn,
                                items: TD.map((String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedOptionnn = value!;
                                  });
                                },
                              ),
                              SizedBox(width: 15),
                              Text(
                                'Matiéres',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF26519e),
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(width: 10),
                              DropdownButton<String>(
                                value: _selectedOptionnnn,
                                items: Matieres.map((String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedOptionnnn = value!;
                                  });
                                },
                              ),
                              SizedBox(width: 15),
                              Text(
                                'Semestre',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF26519e),
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(width: 10),
                              DropdownButton<String>(
                                value: _selectedOptionnnnn,
                                items: semestre.map((String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedOptionnnnn = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),

                          Table(
                            border: TableBorder.all(),
                            columnWidths: const {
                              0: FixedColumnWidth(220),
                              1: FixedColumnWidth(120),
                              2: FixedColumnWidth(300),
                              3: FixedColumnWidth(80),
                              4: FixedColumnWidth(80),
                            },
                            children: [
                              // build the header row
                              buildRow(rows[0], isHeader: true, pa: true),
                              // build the data rows
                              ...rows.sublist(1).map((row) => buildRow(row)).toList(),
                            ],
                          ),
                          const SizedBox(height: 30),

                        ])
    )]))])])));

  }
  TableRow buildRow(List<String> cells,
      {bool isHeader = false,
        bool pa = false,
        Function(List<String>)? onRowChanged}) {
    final controllers = cells.map((cell) {
      return TextEditingController(text: cell);
    }).toList();

    return TableRow(
      decoration: BoxDecoration(
        color: pa ? Colors.grey.shade300 : null,
      ),
      children: [
        for (int i = 0; i < cells.length; i++)
          Container(
            padding: EdgeInsets.all(10),
            height: isHeader?40:50,
            color:isHeader? Colors.white:Colors.green.withOpacity(0.4),
            child: isHeader
                ? Text(cells[i],
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black))
                : TextField(
              controller: controllers[i],
              onChanged: (value) {
                cells[i] = value;
                if (onRowChanged != null) {
                  onRowChanged(cells);
                }
              },
              decoration: InputDecoration(
                hintText: cells[i],
                border: InputBorder.none,
              ),
            ),
          ),
      ],
    );
  }

  List<List<String>> getTableValues() {
    final values = [rows.first];
    values.addAll(rows.sublist(1).map((row) {
      return row.map((cell) => cell).toList();
    }).toList());
    return values;
  }

  List<List<String>> getRowValues() {
    final values = rows.map((row) {
      return row.map((cell) => cell).toList();
    }).toList();
    print(values);
    return values;
  }
}

