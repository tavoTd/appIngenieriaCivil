//
//  NewsMenuViewController.swift
//  appIngenieriaCivil
//
//  Created by CEDAM03 on 25/02/20.
//  Copyright © 2020 CEDAM05. All rights reserved.
//
import UIKit
import SafariServices

//Indica que funciones que tiene que ejecutar el viewcontroller
protocol NewsMenuDelegate {
    
    func moveContainerToShowStudentMenu()
}

//Contiene la información de las noticias
struct NewsContent{
    
    var title: String
    var image: String
    var link: String
    
}

class NewsMenuViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    
    var delegate: NewsMenuDelegate? //permite acceder al protocolo NewsMenuDelegate
    var news = [NewsContent]()//crea un arreglo que contendra las noticias
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        loadingNews()
    }
    
    @IBAction func buttonMenuTapped(_ sender: Any) {
        
        //Manda a llamar la funcion que esta definida en el viewcontroller que se hace cargo
        delegate?.moveContainerToShowStudentMenu()
        
    }
    
    //Redirecciona a la pagina solicitada
    func showSafariVC(for url: String){
        
        guard let url = URL(string: url) else{
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
    //Carga las noticias en el arrgelo
    func loadingNews(){
        news.append(NewsContent.init(title: "La ejecución de proyectos sin planeación propicia corrupción", image: "noticia", link: "http://noticolegio.com/2019/10/08/la-ejecucion-de-proyectos-sin-planeacion-propicia-corrupcion/"))
        news.append(NewsContent.init(title: "Estancada la energía nuclear en México, a pesar se reconocida importancia", image: "noticia", link: "http://noticolegio.com/2019/10/18/estancada-la-energia-nuclear-en-mexico-a-pesar-su-reconocida-importancia/"))
        news.append(NewsContent.init(title: "Más de 130 nuevos socios se integran a las filas de nuestro Colegio", image: "noticia", link: "http://noticolegio.com/2019/09/20/mas-de-130-nuevos-socios-se-integran-a-las-filas-de-nuestro-colegio/"))
        news.append(NewsContent.init(title: "Reconstrucción de la vivienda unifamiliar concluirá a mediados de 2020: Cravioto", image: "noticia", link: "http://noticolegio.com/2019/09/17/reconstruccion-de-la-vivienda-unifamiliar-concluira-a-mediados-de-2018-cravioto/"))
        news.append(NewsContent.init(title: "CICM recibió invitación para integrarse al Consejo para el Fomento a la Inversión", image: "noticia", link: "http://noticolegio.com/2019/09/18/cicm-recibio-invitacion-para-integrarse-al-consejo-para-el-fomento-a-la-inversion/"))
        news.append(NewsContent.init(title: "Plantas modulares podrían alentar nuevo despegue de la geotermia en México", image: "noticia", link: "http://noticolegio.com/2019/11/04/plantas-modulares-podrian-alentar-nuevo-despegue-de-la-geotermia-en-mexico/"))
        news.append(NewsContent.init(title: "El sureste mira con aliento la construcción del Tren Maya y Dos Bocas", image: "noticia", link: "http://noticolegio.com/2019/10/31/el-sureste-mira-con-aliento-la-construccion-del-tren-maya-y-dos-bocas/"))
    }
    
}

//Parte de NewsMenuViewController que se encarga del TableView
extension NewsMenuViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCell
        
    
        cell.imageNews?.image = UIImage(named: news[indexPath.row].image)
        cell.btnTitleNew?.setTitle(news[indexPath.row].title, for: .normal)
        
        cell.sendNews(news[indexPath.row])
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

extension NewsMenuViewController: NewsCellDelegate{
    func didTapTitleNews(url: String) {
        showSafariVC(for: url)
    }
    
    func didTapShareNews(url: String) {
        //Crea un activityViewController para compartir el link.
        let linkToShare = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        present(linkToShare, animated: true, completion: nil)
    }
}
