# Menu items and prices
declare -A menu=(
    ["Pizza"]=250
    ["Burger"]=150
    ["Pasta"]=200
    ["Fries"]=100
    ["Coke"]=50
)
# Function to display the menu
display_menu() {
    echo "--------- Menu ---------"
    for item in "${!menu[@]}"; do
        echo "$item - ${menu[$item]} INR"
    done
    echo "------------------------"
}
# Function to take orders
take_order() {
    echo "Enter the item name (or type 'done' to finish):"
    while true; do
        read -p "Item: " item
        if [[ $item == "done" ]]; then
            break
        elif [[ -n ${menu[$item]} ]]; then
            read -p "Quantity: " quantity
            order+=("$item")
            order_quantity+=("$quantity")
            echo "$item x $quantity added to the order."
        else
            echo "Invalid item. Please try again."
        fi
    done
}
# Function to calculate the bill
calculate_bill() {
    total=0
    echo "--------- Bill ---------"
    for i in "${!order[@]}"; do
        item="${order[$i]}"
        quantity="${order_quantity[$i]}"
        price=$(( menu[$item] * quantity ))
        total=$(( total + price ))
        echo "$item x $quantity = $price INR"
    done
    echo "------------------------"
    echo "Total Bill: $total INR"
}

# Main script
echo "Welcome to the Restaurant Management System!"
# Initialize order arrays
order=()
order_quantity=()
# Display menu and take orders
display_menu
take_order
# Calculate and display the bill
calculate_bill
echo "Thank you for dining with us!"
