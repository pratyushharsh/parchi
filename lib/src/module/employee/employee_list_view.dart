import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../config/theme_settings.dart';
import '../../model/api/get_employee_response.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/my_loader.dart';
import '../authentication/bloc/authentication_bloc.dart';
import '../employee_detail/employee_detail_view.dart';
import 'bloc/employee_bloc.dart';

class EmployeeView extends StatelessWidget {
  const EmployeeView({Key? key}) : super(key: key);

  Widget _buildEmployeeItem(StoreEmployee employee) {
    return Card(
      child: InkWell(
        onTap: () {

        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Employee Id: ${employee.employeeId}'),
                  Text('Joined At: ${DateFormat('dd-MMM-yyyy – kk:mm').format(employee.joinedAt)}'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeBloc(
        employeeRepository: context.read(),
        storeId: BlocProvider.of<AuthenticationBloc>(context)
            .state
            .store!
            .rtlLocId
            .toString(),
      )..add(FetchAllEmployeeEvent()),
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            body: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: 60,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: BlocBuilder<EmployeeBloc, EmployeeState>(
                    builder: (context, state) {
                      if (state.status == EmployeeListStatus.loading) {
                        return const Center(
                          child: MyLoader(color: AppColor.primary),
                        );
                      }
                      return ListView(
                        children: state.employees
                            .map((e) => _buildEmployeeItem(e))
                            .toList(),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 16,
                  child: AppBarLeading(
                    heading: "Employee",
                    icon: Icons.arrow_back,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Positioned(
                  bottom: 40,
                  right: 20,
                  child: OpenContainer(
                    transitionType: ContainerTransitionType.fade,
                    transitionDuration: const Duration(milliseconds: 300),
                    openBuilder: (BuildContext context, VoidCallback _) {
                      return const EmployeeDetailView();
                    },
                    closedElevation: 6.0,
                    closedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(5)),
                    ),
                    closedBuilder:
                        (BuildContext context, void Function() action) {
                      return Container(
                        height: 45,
                        width: 45,
                        color: AppColor.primary,
                        child: const Center(
                          child: Icon(
                            Icons.person_add_alt_1,
                            color: AppColor.iconColor,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
