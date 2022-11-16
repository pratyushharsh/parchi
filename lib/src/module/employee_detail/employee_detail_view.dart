import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../entity/pos/employee_entity.dart';
import '../../model/snackbar_model.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/loading.dart';
import '../../widgets/my_loader.dart';
import '../create_edit_customer/customer_validator.dart';
import 'bloc/create_edit_employee_bloc.dart';
import 'employee_input_validator.dart';

class EmployeeDetailView extends StatelessWidget {
  final EmployeeEntity? employee;

  const EmployeeDetailView({Key? key, this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateEditEmployeeBloc(
        authenticationBloc: context.read(),
        employeeRepository: context.read(),
      )..add(OnLoadExistingEmployee(employee)),
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            body: Stack(
              fit: StackFit.expand,
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: const EmployeeForm(),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 16,
                  child: BlocBuilder<CreateEditEmployeeBloc,
                      CreateEditEmployeeState>(
                    builder: (context, state) {
                      return AppBarLeading(
                        heading:
                            state.newEmployee ? "New Employee" : "Employee",
                        icon: Icons.arrow_back,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  ),
                ),
                BlocConsumer<CreateEditEmployeeBloc, CreateEditEmployeeState>(
                  listener: (context, state) {
                    if (state.status ==
                            CreateEditEmployeeStatus.newUserCreating ||
                        state.status == CreateEditEmployeeStatus.userUpdating) {
                      showLoadingDialog(context);
                    }
                    if (state.status ==
                            CreateEditEmployeeStatus.newUserCreated ||
                        state.status ==
                            CreateEditEmployeeStatus.newUserCreationError ||
                        state.status == CreateEditEmployeeStatus.userUpdated ||
                        state.status ==
                            CreateEditEmployeeStatus.userUpdateError) {
                      Navigator.of(context).pop();
                    }

                    if (CreateEditEmployeeStatus.newUserCreated ==
                        state.status) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        buildSnackBar(
                          ErrorModel(
                            message: "Employee created successfully",
                            level: ErrorLevel.success,
                          ),
                        ),
                      );
                      Navigator.of(context).pop();
                    }

                    if (CreateEditEmployeeStatus.userUpdated ==
                        state.status) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        buildSnackBar(
                          ErrorModel(
                            message: "Employee successfully updated",
                            level: ErrorLevel.success,
                          ),
                        ),
                      );
                    }

                    if (CreateEditEmployeeStatus.newUserCreationError ==
                            state.status ||
                        CreateEditEmployeeStatus.userUpdateError ==
                            state.status) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        buildSnackBar(
                          ErrorModel(
                            message: "${state.error}",
                            level: ErrorLevel.error,
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state.newEmployee &&
                        state.status == CreateEditEmployeeStatus.modifying &&
                        state.isValid) {
                      return Positioned(
                        top: 20,
                        right: 16,
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<CreateEditEmployeeBloc>()
                                .add(OnCreateNewEmployee());
                          },
                          child: const Text(
                            "Create",
                            style: TextStyle(color: AppColor.primary),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0, backgroundColor: AppColor.color8,
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                          ),
                        ),
                      );
                    }

                    if (state.status == CreateEditEmployeeStatus.modifying &&
                        state.isValid) {
                      return Positioned(
                        top: 20,
                        right: 16,
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<CreateEditEmployeeBloc>()
                                .add(OnSaveEmployee());
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(color: AppColor.primary),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0, backgroundColor: AppColor.color8,
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmployeeForm extends StatelessWidget {
  const EmployeeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEditEmployeeBloc, CreateEditEmployeeState>(
      builder: (context, state) {
        if (state.status == CreateEditEmployeeStatus.loading ||
            state.status == CreateEditEmployeeStatus.initial) {
          return const MyLoader(color: AppColor.primary);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            const CircleAvatar(
              radius: 50,
              backgroundColor: AppColor.background,
              child: Icon(
                Icons.person,
                color: Colors.black,
                size: 50,
              ),
            ),
            CustomTextField(
              initialValue: state.firstName,
              label: 'First Name',
              validator: NewPartyFieldValidator.validatePartyName,
              onValueChange: (value) {
                BlocProvider.of<CreateEditEmployeeBloc>(context)
                    .add(OnEmployeeFirstNameChanged(value));
              },
            ),
            CustomTextField(
              initialValue: state.middleName,
              label: 'Middle Name',
              onValueChange: (value) {
                BlocProvider.of<CreateEditEmployeeBloc>(context)
                    .add(OnEmployeeMiddleNameChanged(value));
              },
            ),
            CustomTextField(
              initialValue: state.lastName,
              validator: NewPartyFieldValidator.validatePartyName,
              label: 'Last Name',
              onValueChange: (value) {
                BlocProvider.of<CreateEditEmployeeBloc>(context)
                    .add(OnEmployeeLastNameChanged(value));
              },
            ),
            CustomTextField(
              initialValue: state.phone,
              label: 'Phone',
              validator: NewEmployeeFieldValidator.validatePhone,
              textInputType: TextInputType.phone,
              enabled: state.newEmployee,
              onValueChange: (value) {
                BlocProvider.of<CreateEditEmployeeBloc>(context)
                    .add(OnEmployeePhoneChanged(value));
              },
            ),
            CustomTextField(
              initialValue: state.email,
              validator: NewPartyFieldValidator.validatePartyEmail,
              label: 'Email',
              onValueChange: (value) {
                BlocProvider.of<CreateEditEmployeeBloc>(context)
                    .add(OnEmployeeEmailChanged(value));
              },
            ),
            CustomTextField(
              initialValue: state.locale,
              label: 'Language',
              onValueChange: (value) {
                BlocProvider.of<CreateEditEmployeeBloc>(context)
                    .add(OnEmployeeLocaleChanged(value));
              },
            ),
          ],
        );
      },
    );
  }
}
