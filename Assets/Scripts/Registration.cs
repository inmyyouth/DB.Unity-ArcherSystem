using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;
using UnityEngine.UI;

public class Registration : MonoBehaviour
{
    public InputField nameField;
    public InputField ageField;
    public Dropdown genderField;
    public InputField categoryIDField;

    public Button registerButton;

    public GameObject Success;
    public GameObject Fail;

    public void CallRegister()
    {
        StartCoroutine(Register());
    }

    public void Quit()
    {
        Application.Quit();
    }

    public void GoToMainmenu()
    {
        UnityEngine.SceneManagement.SceneManager.LoadScene(0);
    }

    void Start()
    {
        Success.SetActive(false);
        Fail.SetActive(false);
    }

    IEnumerator Register()
    {
        string url = "http://localhost/registerArcher.php";
        WWWForm form = new WWWForm();
        form.AddField("name", nameField.text);
        form.AddField("age", ageField.text);
        form.AddField("gender", genderField.options[genderField.value].text); //DropDownMenu turn into String
        form.AddField("categoryID", categoryIDField.text);
        UnityWebRequest www = UnityWebRequest.Post(url, form);

        yield return www.SendWebRequest();

        Debug.Log(www.downloadHandler.text);

        if(www.error == null)
        {
            Success.SetActive(true);
        }
        else
        {
            Fail.SetActive(true);
        }
    }

    public void VerifyInputs()
    {
        registerButton.interactable = (nameField.text.Length >= 1 && ageField.text.Length >= 1 && categoryIDField.text.Length >= 1);
    }
}
