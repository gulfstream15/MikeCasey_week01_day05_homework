
# Shop Name
def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

# Total Cash
def total_cash(pet_shop)
  total = pet_shop[:admin][:total_cash]
  return total
end

# Add or remove cash
def add_or_remove_cash(pet_shop,cash)
  pet_shop[:admin][:total_cash] = pet_shop[:admin][:total_cash] + cash
  return pet_shop[:admin][:total_cash]
end

# Pets sold
def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

# Pets sold increase 
def increase_pets_sold(pet_shop, num_pets_sold)
  pet_shop[:admin][:pets_sold] = pet_shop[:admin][:pets_sold] + num_pets_sold
  return pet_shop[:admin][:pets_sold]
end

# Test stock count
def stock_count(pet_shop)
  total_pets = pet_shop[:pets].length()
  return total_pets
end

# Find breed
def pets_by_breed(pet_shop, breed)
  found_breed = []

  for pet in pet_shop[:pets]
    if pet[:breed] == breed 
      found_breed << pet 
    end 
  end

  return found_breed 

end

# Find pet by name
def find_pet_by_name(pet_shop, name)
  result = nil

  for pet in pet_shop[:pets]
    if pet[:name] == name
      result = name
    end 
  end

  return result

end

# Remove pet by name
def remove_pet_by_name(pet_shop, name)
  pet_index = 0
  found_index = 0

  for pet in pet_shop[:pets]
    if pet[:name] == name
      found_index = pet_index   
    end
    pet_index += 1 
  end

  pet_shop[:pets].delete_at(found_index)

end

# Add pet to stock
def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].insert(0, new_pet)
end

# Stock count
def stock_count(pet_shop)
  return pet_shop[:pets].size()
end 

# Customer pet count
def customer_pet_count(customer)
  pets_per_customer = customer[:pets].size()
  return pets_per_customer
end

# Add pet to customer
def add_pet_to_customer(customer, new_pet)
  customer[:pets].insert(0, new_pet)  
end

# Check if customer can afford pet
def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] > new_pet[:price]
    return true
  else 
    return false
  end
end

# Sell pet to customer (or not)
def sell_pet_to_customer(pet_shop, pet, customer)

  pet_string = pet.to_s()
  pet_cost = 0

  # Check to see if pet exists. If so:
  # Check that customer has the funds. If so:
  # 1. add pet to customer's pet list
  # 2. increase pets sold
  # 3. retrieve cost of pet and add to total
  # 4. remove the pet from the stock
  for pet in pet_shop[:pets]
    if pet[:name] == pet_string
      pet_cost = pet[:price]
      if ( customer_can_afford_pet(customer, pet) )
        customer[:pets] << pet_string
        increase_pets_sold(pet_shop, 1)
        add_or_remove_cash(pet_shop, pet_cost)
        remove_pet_by_name(pet_shop, pet)
      end  
      break
    end
  end

end

