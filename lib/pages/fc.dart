import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fundamentos_de_programacao_aplicada/classes/model.dart';
import 'package:fundamentos_de_programacao_aplicada/classes/fc_layer.dart';
import 'package:fundamentos_de_programacao_aplicada/pages/review.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FC extends StatefulWidget {
  const FC({Key? key}) : super(key: key);

  @override
  _FCState createState() => _FCState();
}

class _FCState extends State<FC> {
  late Model modelInfo;

  Map KValues = {
    '0': {'value': '', 'checked': false},
    '1': {'value': '', 'checked': false},
    '2': {'value': '', 'checked': false}
  };

  Map UnitsValues = {
    '64': {'value': '', 'checked': false},
    '128': {'value': '', 'checked': false},
    '256': {'value': '', 'checked': false},
    '512': {'value': '', 'checked': false}
  };

  Map lrValues = {
    '0.1': {'value': '', 'checked': false},
    '0.01': {'value': '', 'checked': false},
    '0.001': {'value': '', 'checked': false},
    '0.0001': {'value': '', 'checked': false}
  };

  FcLayer fc = FcLayer();

  @override
  Widget build(BuildContext context) {
    modelInfo = context.watch<Model>();

    String KExp =
        KValues['0']['value'] + KValues['1']['value'] + KValues['2']['value'];

    if (KExp.length > 1) {
      fc.k = KExp.substring(0, KExp.length - 2);
    } else {
      fc.k = KExp;
    }

    String UnitsExp = UnitsValues['64']['value'] +
        UnitsValues['128']['value'] +
        UnitsValues['256']['value'] +
        UnitsValues['512']['value'];

    if (UnitsExp.length > 1) {
      fc.units = UnitsExp.substring(0, UnitsExp.length - 2);
    } else {
      fc.units = UnitsExp;
    }

    String lr = lrValues['0.1']['value'] +
        lrValues['0.01']['value'] +
        lrValues['0.001']['value'] +
        lrValues['0.0001']['value'];

    if (lr.length > 1) {
      lr = lr.substring(0, lr.length - 2);
    }

    String fcExp = '<(fc(${fc.units})) * (${fc.k})>';

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [logo]
            //child: logo,
            //const Text('Neural Network Designer'),
            ),
        backgroundColor: Colors.black,
        toolbarHeight: 60,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          modelInfo.fc = fc;
          modelInfo.lr = lr;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Review()));
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.arrow_forward),
      ),
      body: Column(
        children: [
          _titleSection('<FC>', fcExp),
          const SizedBox(height: 10),
          const SizedBox(
            height: 25,
            width: 300,
            child: Text(
              'Units',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25),
            ),
          ),
          const SizedBox(height: 10),
          Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 15,
                      width: 30,
                      child: Text('64',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15)),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                        height: 10,
                        width: 10,
                        child: Checkbox(
                          value: UnitsValues['64']['checked'],
                          onChanged: (bool? checkedlr1) {
                            setState(() {
                              UnitsValues['64']['checked'] = checkedlr1;
                              if (checkedlr1 == true) {
                                UnitsValues['64']['value'] = '64 |';
                              } else {
                                UnitsValues['64']['value'] = '';
                              }
                            });
                          },
                        )),
                  ],
                ),
                const SizedBox(width: 15),
                Column(
                  children: [
                    const SizedBox(
                      height: 15,
                      width: 30,
                      child: Text('128',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15)),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 10,
                      width: 10,
                      child: Checkbox(
                        value: UnitsValues['128']['checked'],
                        onChanged: (bool? checked2) {
                          setState(() {
                            UnitsValues['128']['checked'] = checked2;
                            if (checked2 == true) {
                              UnitsValues['128']['value'] = ' 128 |';
                            } else {
                              UnitsValues['128']['value'] = '';
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                Column(
                  children: [
                    const SizedBox(
                      height: 15,
                      width: 30,
                      child: Text('256',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15)),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 10,
                      width: 10,
                      child: Checkbox(
                        value: UnitsValues['256']['checked'],
                        onChanged: (bool? checked3) {
                          setState(() {
                            UnitsValues['256']['checked'] = checked3;
                            if (checked3 == true) {
                              UnitsValues['256']['value'] = ' 256 |';
                            } else {
                              UnitsValues['256']['value'] = '';
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                Column(
                  children: [
                    const SizedBox(
                      height: 15,
                      width: 30,
                      child: Text('512',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15)),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 10,
                      width: 10,
                      child: Checkbox(
                        value: UnitsValues['512']['checked'],
                        onChanged: (bool? checked4) {
                          setState(() {
                            UnitsValues['512']['checked'] = checked4;
                            if (checked4 == true) {
                              UnitsValues['512']['value'] = ' 512 |';
                            } else {
                              UnitsValues['512']['value'] = '';
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ]),
          const SizedBox(height: 30),
          const SizedBox(
            height: 25,
            width: 25,
            child: Text(
              'K',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25),
            ),
          ),
          const SizedBox(height: 10),
          Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 15,
                      width: 10,
                      child: Text('0',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15)),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 10,
                      width: 10,
                      child: Checkbox(
                        value: KValues['0']['checked'],
                        onChanged: (bool? checkedm0) {
                          setState(() {
                            KValues['0']['checked'] = checkedm0;
                            if (checkedm0 == true) {
                              KValues['0']['value'] = '0 |';
                            } else {
                              KValues['0']['value'] = '';
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 30),
                Column(
                  children: [
                    const SizedBox(
                      height: 15,
                      width: 10,
                      child: Text('1',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15)),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                        height: 10,
                        width: 10,
                        child: Checkbox(
                          value: KValues['1']['checked'],
                          onChanged: (bool? checkedm1) {
                            setState(() {
                              KValues['1']['checked'] = checkedm1;
                              if (checkedm1 == true) {
                                KValues['1']['value'] = ' 1 |';
                              } else {
                                KValues['1']['value'] = '';
                              }
                            });
                          },
                        )),
                  ],
                ),
                const SizedBox(width: 30),
                Column(
                  children: [
                    const SizedBox(
                      height: 15,
                      width: 10,
                      child: Text('2',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15)),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 10,
                      width: 10,
                      child: Checkbox(
                        value: KValues['2']['checked'],
                        onChanged: (bool? checkedm2) {
                          setState(() {
                            KValues['2']['checked'] = checkedm2;
                            if (checkedm2 == true) {
                              KValues['2']['value'] = ' 2 |';
                            } else {
                              KValues['2']['value'] = '';
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ]),
          const SizedBox(height: 30),
          _titleSection('Learning Rate', lr),
          Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 15,
                      width: 50,
                      child: Text('0.1',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15)),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                        height: 10,
                        width: 10,
                        child: Checkbox(
                          value: lrValues['0.1']['checked'],
                          onChanged: (bool? checked1) {
                            setState(() {
                              lrValues['0.1']['checked'] = checked1;
                              if (checked1 == true) {
                                lrValues['0.1']['value'] = '0.1 |';
                              } else {
                                lrValues['0.1']['value'] = '';
                              }
                            });
                          },
                        )),
                  ],
                ),
                const SizedBox(width: 5),
                Column(
                  children: [
                    const SizedBox(
                      height: 15,
                      width: 50,
                      child: Text('0.01',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15)),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 10,
                      width: 10,
                      child: Checkbox(
                        value: lrValues['0.01']['checked'],
                        onChanged: (bool? checkedlr2) {
                          setState(() {
                            lrValues['0.01']['checked'] = checkedlr2;
                            if (checkedlr2 == true) {
                              lrValues['0.01']['value'] = ' 0.01 |';
                            } else {
                              lrValues['0.01']['value'] = '';
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 5),
                Column(
                  children: [
                    const SizedBox(
                      height: 15,
                      width: 50,
                      child: Text('0.001',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15)),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 10,
                      width: 10,
                      child: Checkbox(
                        value: lrValues['0.001']['checked'],
                        onChanged: (bool? checkedlr3) {
                          setState(() {
                            lrValues['0.001']['checked'] = checkedlr3;
                            if (checkedlr3 == true) {
                              lrValues['0.001']['value'] = ' 0.001 |';
                            } else {
                              lrValues['0.001']['value'] = '';
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 5),
                Column(
                  children: [
                    const SizedBox(
                      height: 15,
                      width: 50,
                      child: Text('0.0001',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15)),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 10,
                      width: 10,
                      child: Checkbox(
                        value: lrValues['0.0001']['checked'],
                        onChanged: (bool? checkedlr4) {
                          setState(() {
                            lrValues['0.0001']['checked'] = checkedlr4;
                            if (checkedlr4 == true) {
                              lrValues['0.0001']['value'] = ' 0.0001 |';
                            } else {
                              lrValues['0.0001']['value'] = '';
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ]),
        ],
      ),
    );
    //);
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.white,
  backgroundColor: Colors.teal,
  minimumSize: const Size(300, 50),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
);

Container _titleSection(String title, String expression) {
  return Container(
    padding: const EdgeInsets.all(15),
    child: Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30),
                ),
              ),
              Container(
                child: Text(
                  expression,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                      fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

String logoString =
    '''<svg xmlns="http://www.w3.org/2000/svg" data-name="Layer 1" viewBox="1.9981324672698975 2 60.00088882446289 60" x="0" y="0" height="170.72091378104878" width="170.72344279645705" class="icon-icon-0" data-fill-palette-color="accent" id="icon-0"><path d="M59.831 29.132a27.631 27.631 0 0 0-5.243-13.641A2.967 2.967 0 0 0 55 14a3 3 0 0 0-3-3 2.972 2.972 0 0 0-1.222 0.266 27.69 27.69 0 0 0-5.917-4.12A2.994 2.994 0 0 0 42 5a2.958 2.958 0 0 0-1.4 0.365A27.864 27.864 0 0 0 32 4a27.238 27.238 0 0 0-3.3 0.209A8.07 8.07 0 0 0 23.222 2c-4.045 0-7.532 3.162-8.5 7.608-3.8 1.166-6.5 5.131-6.5 9.7A10.719 10.719 0 0 0 8.3 20.554C4.6 21.8 2 25.688 2 30.188a10.368 10.368 0 0 0 4.655 8.85 11.034 11.034 0 0 0-1.544 5.65c0 5.548 3.938 10.062 8.778 10.062a7.151 7.151 0 0 0 0.906-0.059C15.851 58.983 19.262 62 23.222 62A8.07 8.07 0 0 0 28.7 59.791 27.238 27.238 0 0 0 32 60a27.864 27.864 0 0 0 8.6-1.365A2.958 2.958 0 0 0 42 59a2.994 2.994 0 0 0 2.861-2.146 27.69 27.69 0 0 0 5.917-4.12A2.972 2.972 0 0 0 52 53a3 3 0 0 0 3-3 2.967 2.967 0 0 0-0.412-1.491 27.631 27.631 0 0 0 5.243-13.641 2.981 2.981 0 0 0 0-5.736ZM52 47a2.971 2.971 0 0 0-0.424 0.043l-6.1-9.58A1 1 0 0 0 44.636 37H32V33H56.184a3.01 3.01 0 0 0 1.648 1.763A25.628 25.628 0 0 1 53.064 47.2 2.966 2.966 0 0 0 52 47ZM42 53a2.972 2.972 0 0 0-1.168 0.237L32 42.638V39H44.087L49.8 47.977a2.927 2.927 0 0 0-0.467 3.367 25.652 25.652 0 0 1-4.654 3.334A2.991 2.991 0 0 0 42 53ZM40.832 10.763a2.982 2.982 0 0 0 3.847-1.441 25.652 25.652 0 0 1 4.654 3.334 2.927 2.927 0 0 0 0.467 3.367L44.087 25H32V21.362ZM53.064 16.8a25.628 25.628 0 0 1 4.768 12.441A3.01 3.01 0 0 0 56.184 31H32V27H44.636a1 1 0 0 0 0.844-0.463l6.1-9.58a2.613 2.613 0 0 0 1.488-0.161ZM53 14a1 1 0 1 1-1-1A1 1 0 0 1 53 14ZM42 7a1 1 0 1 1-1 1A1 1 0 0 1 42 7Zm-2.824 0.028A2.835 2.835 0 0 0 39.364 9.4L32 18.238V12.063a10.984 10.984 0 0 0-1.75-6C30.823 6.021 31.407 6 32 6A25.9 25.9 0 0 1 39.176 7.028ZM23.222 60c-3.271 0-6.069-2.788-6.652-6.63a0.637 0.637 0 0 0-0.023-0.061 4.621 4.621 0 0 1 2.786-0.976 5 5 0 0 1 3.886 2.042l1.562-1.25a6.956 6.956 0 0 0-5.448-2.792 6.843 6.843 0 0 0-5.095 2.393c-0.116 0.008-0.235 0.024-0.349 0.024-3.737 0-6.778-3.617-6.778-8.062a8.913 8.913 0 0 1 1.8-5.41 0.986 0.986 0 0 0 0.139-0.3c1.6-2.3 3.57-3.557 5.622-3.557 2.279 0 4.46 1.544 6.142 4.348l1.715-1.03c-2.057-3.429-4.848-5.318-7.857-5.318h0c-2.572 0-4.98 1.39-6.911 3.931A8.307 8.307 0 0 1 4 30.188a8.083 8.083 0 0 1 4.44-7.549 8.436 8.436 0 0 0 6.226 3.121c0.151 0 0.3-0.005 0.456-0.015 2.824-0.186 5.453-2.073 7.4-5.312L20.81 19.4c-1.6 2.662-3.668 4.206-5.819 4.348a6.135 6.135 0 0 1-4.685-2.042 0.972 0.972 0 0 0 0.1-0.61 9.461 9.461 0 0 1-0.179-1.784 8.074 8.074 0 0 1 4.519-7.582 7.13 7.13 0 0 0 4.78 1.927c0.088 0 0.177 0 0.266-0.006a6.731 6.731 0 0 0 4.991-2.6L23.222 9.791a4.762 4.762 0 0 1-3.515 1.863 4.875 4.875 0 0 1-3.152-1.018c0-0.022 0.016-0.041 0.02-0.064C17.177 6.764 19.972 4 23.222 4 26.959 4 30 7.617 30 12.063V51.938C30 56.383 26.959 60 23.222 60Zm7.028-2.059a10.983 10.983 0 0 0 1.75-6V45.762L39.364 54.6a2.835 2.835 0 0 0-0.188 2.373A25.889 25.889 0 0 1 32 58C31.407 58 30.823 57.979 30.25 57.941ZM42 57a1 1 0 1 1 1-1A1 1 0 0 1 42 57Zm10-6a1 1 0 1 1 1-1A1 1 0 0 1 52 51Zm7-18a1 1 0 1 1 1-1A1 1 0 0 1 59 33Z" fill="#266c4d" data-fill-palette-color="accent"></path></svg>''';

final Widget logo = SvgPicture.string(
  logoString,
  semanticsLabel: 'Logo',
  width: 60,
  height: 60,
  colorFilter: const ColorFilter.mode(Colors.teal, BlendMode.srcIn),
);
