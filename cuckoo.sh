OUTPUT_FILE="${PROJECT_DIR}/${PROJECT_NAME}Tests/Mocks/GeneratedMocks.swift"
echo "Generated Mocks File = $OUTPUT_FILE"

INPUT_DIR="$PROJECT_DIR"
echo "Mocks Input Directory = $INPUT_DIR"

${PODS_ROOT}/Cuckoo/run generate --testable "EmployeeApp" \
--output "${OUTPUT_FILE}" \
"$INPUT_DIR/$(find . -name LoginView.swift)" \
"$INPUT_DIR/$(find . -name ListOfEmployeesView.swift)" \
"$INPUT_DIR/$(find . -name SelectPreferredColorView.swift)" \
"$INPUT_DIR/$(find . -name ReviewDetailsView.swift)" \
"$INPUT_DIR/$(find . -name EmployeeRepository.swift)" \
