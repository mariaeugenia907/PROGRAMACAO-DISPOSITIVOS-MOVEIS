import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:post/user.dart';

import 'api.dart';
import 'detailpage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Http-Json-ListView',
      home: BuildListView(),
    );
  }
}

class BuildListView extends StatefulWidget {
  const BuildListView({Key? key}) : super(key: key);

  @override
  State<BuildListView> createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  final PagingController<int, User> _pagingController =
  PagingController(firstPageKey: 1);

  final int _pageSize = 20;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de post'),
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(
              () => _pagingController.refresh(),
        ),
        child: PagedListView<int, User>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<User>(
            animateTransitions: true,
            itemBuilder: (context, user, index) => TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: DetailPage(user),
                    type: PageTransitionType.rotate,
                    alignment: Alignment.center,
                  ),
                  );
              },
              child: ListTile(
                leading: Text('${user.id}'),
                title: Text('${user.title}'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      final newItems = await fetchUser(pageKey, _pageSize);
      final isLastPage = newItems.length < _pageSize;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = ++pageKey;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }
}

Future<List<User>> fetchUser(pageKey, pageSize) async {
  List<User> users = [];

  return await API.getUsers(pageKey, pageSize).then(
        (response) {
      Iterable lista = json.decode(response.body);
      users = lista.map((model) => User.fromJson(model)).toList();
      return users;
    },
  );
}



