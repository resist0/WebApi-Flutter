import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_cursos/models/curso_model.dart';

class CursosDetalhesScreen extends StatefulWidget {
  @override
  _CursosDetalhesScreenState createState() => _CursosDetalhesScreenState();
}

class _CursosDetalhesScreenState extends State<CursosDetalhesScreen> {
  
    CursoModel cursoModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();


  Widget build(BuildContext context) {
    cursoModel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        title: Text(cursoModel.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            labelValue('ID'),
            fieldValue(cursoModel.id.toString()),
            espaco(),
            labelValue('Nível'),
            fieldValue(cursoModel.nivel),
            espaco(),
            labelValue('Preço'),
            fieldValue(cursoModel.preco.toString()),
            espaco(),
            labelValue('% Conclusão'),
            fieldValue(cursoModel.percentualConclusao.toString()),
            espaco(),
            labelValue('Conteúdo'),
            fieldValue(cursoModel.conteudo),
            espaco(),
            Center(
              child: RaisedButton(
                color: Color.fromRGBO(64, 75, 96, .9),
                textColor: Colors.white,
                child: Text("Editar"),
                onPressed: () async {
                  var retorno = await Navigator.pushNamed(
                    context,
                    "/cursos_editar",
                    arguments: cursoModel,
                  );

                  if (retorno != null) {

                    cursoModel = retorno as CursoModel;

                    setState(() { });

                    scaffoldKey.currentState.showSnackBar(
                      new SnackBar(
                        content: Text(
                          'Curso alterado com sucesso!',
                        ),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  SizedBox espaco() => SizedBox(
        height: 16,
      );

  Widget labelValue(String _label) {
    return Text(
      '$_label:',
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Color.fromRGBO(64, 75, 96, 1),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      ),
    );
  }

  Widget fieldValue(String _value) {
    return Text(
      _value,
      style: TextStyle(
        color: Color.fromRGBO(64, 75, 96, .9),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w800,
        fontSize: 20,
      ),
    );
  }
}
